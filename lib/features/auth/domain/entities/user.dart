import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// HÀM BẮT ID THÔNG MINH: Có gạch dưới hay không gạch dưới đều lấy được hết!
Object? _readId(Map<dynamic, dynamic> json, String key) {
  return json['_id'] ?? json['id'] ?? '';
}

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    // Sử dụng readValue thay vì name
    @JsonKey(readValue: _readId) required String id,

    required String fullName,
    required String email,
    @Default("user") String role,
    @Default("Member") String rank,
    @Default(false) bool verified,
    String? phone,
    String? address,
    String? avatar,
    @Default(0) int totalSpent,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}