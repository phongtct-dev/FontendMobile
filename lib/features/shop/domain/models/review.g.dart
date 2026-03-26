// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewUserImpl _$$ReviewUserImplFromJson(Map<String, dynamic> json) =>
    _$ReviewUserImpl(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$ReviewUserImplToJson(_$ReviewUserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };

_$ReviewEntityImpl _$$ReviewEntityImplFromJson(Map<String, dynamic> json) =>
    _$ReviewEntityImpl(
      id: json['_id'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      user: ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReviewEntityImplToJson(_$ReviewEntityImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'rating': instance.rating,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
    };
