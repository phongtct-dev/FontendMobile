import 'package:dio/dio.dart';
import '../services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storage;
  bool _isRefreshing = false; // Khóa chống gọi refresh liên tục

  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Nếu lỗi 401 (Hết hạn Token) và không phải là đang gọi API đăng nhập/đăng ký
    if (err.response?.statusCode == 401 && !err.requestOptions.path.contains('/auth/')) {

      if (!_isRefreshing) {
        _isRefreshing = true;

        final refreshToken = await _storage.getRefreshToken();
        if (refreshToken != null) {
          try {
            print("⏳ Token hết hạn! Đang gọi Refresh Token ngầm...");

            // TẠO MỘT DIO MỚI (Tránh bị dính vòng lặp vô tận của Interceptor cũ)
            final refreshDio = Dio(BaseOptions(baseUrl: err.requestOptions.baseUrl));

            final response = await refreshDio.post('/auth/refresh-token', data: {
              'refreshToken': refreshToken
            });

            if (response.statusCode == 200) {
              print("✅ Lấy Token mới THÀNH CÔNG!");
              final newAccess = response.data['accessToken'];
              final newRefresh = response.data['refreshToken'];

              // 1. Lưu token mới vào máy
              await _storage.saveTokens(newAccess, newRefresh);

              // 2. Gắn token mới vào cái request vừa bị lỗi
              err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';

              // 3. THỰC THI LẠI REQUEST VỪA BỊ LỖI
              final retryResponse = await refreshDio.fetch(err.requestOptions);

              _isRefreshing = false;
              // Trả kết quả thành công về cho UI (UI không hề biết có lỗi xảy ra)
              return handler.resolve(retryResponse);
            }
          } catch (e) {
            print("❌ Refresh Token thất bại hoặc đã hết hạn! Văng ra Login.");
            await _storage.clearAll();
            // TODO: Bắn Event Logout ép GoRouter đẩy ra ngoài
          } finally {
            _isRefreshing = false;
          }
        } else {
          await _storage.clearAll();
        }
      }
    }

    // Các lỗi khác thì cứ báo bình thường
    return handler.next(err);
  }
}