import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'register_provider.g.dart';

@riverpod
class RegisterState extends _$RegisterState {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> signUp(String fullName, String email, String password) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.register(fullName, email, password);
    });

    state = result;
    return !result.hasError; // Trả về true nếu đăng ký & gửi OTP thành công
  }
}