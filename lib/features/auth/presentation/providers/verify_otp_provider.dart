import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'verify_otp_provider.g.dart';

@riverpod
class VerifyOtpState extends _$VerifyOtpState {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> verify(String email, String code) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.verifyCode(email, code);
    });

    state = result;
    return !result.hasError;
  }
}