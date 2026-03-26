import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/user.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  FutureOr<UserEntity?> build() async {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      return await repo.login(email, password);
    });
  }

  // --- HÀM ĐĂNG XUẤT CHUẨN KIẾN TRÚC CỦA BẠN ---
  Future<void> logout() async {
    try {
      // 1. Báo cho Backend biết là user đăng xuất (Xóa cookie phía server)
      await ref.read(dioProvider).post('/auth/sign-out');
    } catch (e) {
      print("Lỗi API đăng xuất, nhưng vẫn tiếp tục xóa local: $e");
    } finally {
      // 2. Gọi hàm logout trong AuthRepositoryImpl của bạn (chứa lệnh _storage.clearAll())
      await ref.read(authRepositoryProvider).logout();

      // 3. Xóa state để GoRouter tự động đẩy văng ra màn hình Login
      state = const AsyncData(null);
    }
  }

  // --- HÀM ĐỔI MẬT KHẨU ---
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      await ref.read(dioProvider).patch('/auth/change-password', data: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });
    } on DioException catch (e) {
      String errorMessage = "Lỗi đổi mật khẩu";
      if (e.response?.data != null && e.response?.data is Map) {
        // Bắt chính xác câu chữ lỗi từ Backend (ví dụ: "Mat khau cu cua ban khong chinh xac")
        errorMessage = e.response!.data['message'] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }
}