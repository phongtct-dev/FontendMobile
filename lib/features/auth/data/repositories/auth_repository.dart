import '../../domain/entities/user.dart';


abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<void> register(String fullName, String email, String password);
  Future<void> sendVerificationCode(String email);
  Future<void> verifyCode(String email, String code);
  Future<void> logout();
}