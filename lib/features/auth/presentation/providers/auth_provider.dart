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
    state = const AsyncLoading(); // Hiển thị vòng quay loading

    try {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.login(email, password);
      state = AsyncData(user); // Đăng nhập thành công!

    } on DioException catch (e) {
      // 1. GHI ĐÈ CÂU LỖI MẶC ĐỊNH THÀNH CÂU CỦA BẠN (Bỏ chữ lỗi máy chủ)
      String errorMessage = "Tài khoản hoặc mật khẩu của bạn không đúng! mời nhập lại!";

      // 2. Tùy chọn: Nếu backend trả về lỗi đặc biệt khác (vd: "Tài khoản bị khóa" hay "Chưa xác thực")
      // thì ta mới ưu tiên hiển thị. Còn lỗi sai pass/user mặc định bị ghi đè.
      if (e.response?.data != null && e.response?.data is Map) {
        String backendMsg = e.response!.data['message'] ?? "";

        // Nếu backend báo lỗi không phải là sai pass/user, ta giữ lại thông báo đó
        if (backendMsg.isNotEmpty &&
            !backendMsg.contains("Thong tin dang nhap") &&
            !backendMsg.contains("User khong ton tai")) {
          errorMessage = backendMsg;
        }
      }

      state = AsyncError(errorMessage, StackTrace.current); // Ném lỗi ra cho UI

    } catch (e) {
      // Bắt các lỗi vặt khác (ví dụ sập mạng hoàn toàn) cũng gom chung về câu này
      state = AsyncError("Tài khoản hoặc mật khẩu của bạn không đúng! mời nhập lại!", StackTrace.current);
    }
  }

  // --- HÀM ĐĂNG XUẤT ---
  Future<void> logout() async {
    try {
      await ref.read(dioProvider).post('/auth/sign-out');
    } catch (e) {
      print("Lỗi API đăng xuất: $e");
    } finally {
      await ref.read(authRepositoryProvider).logout();
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
      String errorMessage = "Tài khoản hoặc mật khẩu của bạn không đúng! mời nhập lại!";
      if (e.response?.data != null && e.response?.data is Map) {
        errorMessage = e.response!.data['message'] ?? errorMessage;
      }
      throw Exception(errorMessage);
    }
  }
}