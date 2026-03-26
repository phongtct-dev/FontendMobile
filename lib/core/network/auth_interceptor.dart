import 'package:dio/dio.dart';
import '../services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storage;

  AuthInterceptor(this._storage);

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  //   // 1. Lấy token từ bộ nhớ bảo mật
  //   final token = await _storage.getAccessToken();
  //
  //
  //
  //   // 2. Nếu có token, đính vào Header Authorization
  //   if (token != null) {
  //     options.headers['Authorization'] = 'Bearer $token';
  //   }
  //
  //   return handler.next(options);
  // }
  //
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // Global Error Handling: 401 Unauthorized
  //   if (err.response?.statusCode == 401) {
  //     // Logic xử lý khi token hết hạn (ví dụ: yêu cầu đăng nhập lại)
  //     _storage.clearAll();
  //   }
  //   return handler.next(err);
  // }


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getAccessToken();

    // TEST 1: Kiểm tra xem App có lấy được Token từ Storage không
    print("--- 🛡️ AUTH CHECK ---");
    print("Token trong Storage: ${token != null ? '✅ Đã có' : '❌ Trống'}");

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      print("Header gửi đi: ${options.headers['Authorization']}");
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TEST 2: Xem mã lỗi thực sự từ Server
    print("--- ⚠️ NETWORK ERROR ---");
    print("URL: ${err.requestOptions.uri}");
    print("Status Code: ${err.response?.statusCode}");
    print("Message: ${err.message}");
    print("Data từ Server (nếu có): ${err.response?.data}");

    return handler.next(err);
  }

}