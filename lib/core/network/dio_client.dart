import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/env_config.dart';
import '../services/storage_service.dart';
import 'auth_interceptor.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(DioRef ref) {
  // Lấy storage service provider đã tạo ở trên
  final storage = ref.watch(storageServiceProvider);

  final options = BaseOptions(
    baseUrl: EnvConfig.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    contentType: 'application/json',
  );

  final dio = Dio(options);

  // Thêm Interceptors
  dio.interceptors.add(AuthInterceptor(storage));
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));

  return dio;
}