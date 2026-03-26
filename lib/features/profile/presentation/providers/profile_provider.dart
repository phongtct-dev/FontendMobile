import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../auth/domain/entities/user.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<UserEntity?> build() async {
    print("--- FETCHING PROFILE ---");
    return _fetchProfile();
  }

  Future<UserEntity> _fetchProfile() async {
    final response = await ref.read(dioProvider).get('/profile/profile');
    // Nhớ thay UserEntity.fromJson hoặc UserModel.fromJson tùy file entity của bạn
    return UserEntity.fromJson(response.data['data']);
  }

  // --- HÀM CẬP NHẬT HỖ TRỢ UPLOAD ẢNH ---
  Future<void> updateProfile({
    String? fullName,
    String? phone,
    String? address,
    File? avatarFile // Thêm tham số nhận File ảnh
  }) async {
    // Lưu lại state cũ để lỡ lỗi thì phục hồi
    final previousState = state.valueOrNull;
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      // 1. Khởi tạo FormData
      final formData = FormData.fromMap({
        if (fullName != null && fullName.isNotEmpty) 'fullName': fullName,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
        if (address != null && address.isNotEmpty) 'address': address,
      });

      // 2. Nếu người dùng có chọn ảnh mới, nhét ảnh vào FormData
      if (avatarFile != null) {
        String fileName = avatarFile.path.split('/').last;
        formData.files.add(MapEntry(
          'avatar', // Tên field này phải KHỚP 100% với upload.single('avatar') ở Backend
          await MultipartFile.fromFile(avatarFile.path, filename: fileName),
        ));
      }

      // 3. Gửi PATCH request
      final response = await ref.read(dioProvider).patch(
          '/profile/update-profile',
          data: formData
      );

      return UserEntity.fromJson(response.data['data']);
    });

    // Nếu có lỗi thì lấy lại state cũ
    if (state.hasError) {
      state = AsyncData(previousState);
      throw state.error!; // Ném lỗi ra UI để hiện SnackBar
    }
  }
}