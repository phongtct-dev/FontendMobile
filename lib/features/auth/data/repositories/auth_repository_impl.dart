import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/entities/user.dart';

import '../datasources/auth_remote_source.dart';
import 'auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  final StorageService _storage;

  AuthRepositoryImpl(this._remoteSource, this._storage);

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await _remoteSource.signIn(email, password);

    // Dựa vào Log: response.data chính là Object chứa {status, message, user, accessToken...}
    final data = response.data;

    final userData = data['user'];
    final String? accessToken = data['accessToken'];
    final String? refreshToken = data['refreshToken'];

    if (accessToken == null || refreshToken == null) {
      throw Exception("Không tìm thấy Token trong phản hồi từ Server");
    }

    // Lưu token vào SecureStorage
    await _storage.saveTokens(accessToken, refreshToken);

    // Map JSON sang Entity
    return UserEntity.fromJson(userData);
  }

  @override
  Future<void> logout() async => await _storage.clearAll();

  @override
  Future<void> register(String fullName, String email, String password) async {
    // 1. Gọi API đăng ký
    await _remoteSource.signUp(fullName, email, password);

    // 2. Tự động gọi API gửi mã OTP ngay sau khi đăng ký thành công
    await _remoteSource.sendOTP(email);

    // Lưu ý: Không trả về UserEntity ở đây vì tài khoản chưa verified,
    // bắt người dùng xác thực OTP trước.
  }
  @override
  Future<void> sendVerificationCode(String email) async {
    await _remoteSource.sendOTP(email);
  }
  @override
  Future<void> verifyCode(String email, String code) async {}
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final remote = AuthRemoteSource(dio);
  final storage = ref.watch(storageServiceProvider);

  return AuthRepositoryImpl(remote, storage);
}