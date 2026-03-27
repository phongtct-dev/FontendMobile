import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';

part 'forgot_password_provider.g.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  // 1. Gửi mã về Email
  Future<bool> sendCode(String email) async {
    state = const AsyncLoading();
    try {
      await ref.read(dioProvider).post('/auth/send-forgot-password-code', data: {'email': email});
      state = const AsyncData(null);
      return true;
    } on DioException catch (e) {
      String msg = e.response?.data['message'] ?? "Lỗi gửi mã xác nhận";
      state = AsyncError(msg, StackTrace.current);
      return false;
    }
  }

  // 2. Xác nhận mã và đổi Mật khẩu mới
  Future<bool> resetPassword(String email, String code, String newPassword) async {
    state = const AsyncLoading();
    try {
      await ref.read(dioProvider).patch('/auth/forgot-password-code', data: {
        'email': email,
        'providedCode': code,
        'newPassword': newPassword,
      });
      state = const AsyncData(null);
      return true;
    } on DioException catch (e) {
      String msg = e.response?.data['message'] ?? "Mã xác nhận không hợp lệ hoặc đã hết hạn";
      state = AsyncError(msg, StackTrace.current);
      return false;
    }
  }
}