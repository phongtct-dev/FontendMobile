import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteSource {
  final Dio _dio;

  AuthRemoteSource(this._dio);

  // Đăng ký
  Future<Response> signUp(String fullName, String email, String password) async {
    return await _dio.post('/auth/sign-up', data: {
      'fullName': fullName,
      'email': email,
      'password': password,
    });
  }

  // Gửi mã OTP
  Future<Response> sendOTP(String email) async {
    return await _dio.post('/auth/send-verification-code', data: {'email': email});
  }

  // Xác thực OTP
  Future<Response> verifyOTP(String email, String code) async {
    return await _dio.post('/auth/verify-verification-code', data: {
      'email': email,
      'providedCode': code,
    });
  }

  // Đăng nhập
  Future<Response> signIn(String email, String password) async {
    return await _dio.post('/auth/sign-in', data: {
      'email': email,
      'password': password,
    });
  }
}