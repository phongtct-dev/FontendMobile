import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class ReviewUser with _$ReviewUser {
  const factory ReviewUser({
    @JsonKey(name: '_id') required String id,
    required String fullName,
    String? avatar,
  }) = _ReviewUser;

  factory ReviewUser.fromJson(Map<String, dynamic> json) => _$ReviewUserFromJson(json);
}

@freezed
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    @JsonKey(name: '_id') required String id,
    required String review,
    required double rating,
    required ReviewUser user,
    required DateTime createdAt,
  }) = _ReviewEntity;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => _$ReviewEntityFromJson(json);
}