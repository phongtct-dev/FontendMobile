// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: _readId(json, 'id') as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: json['role'] as String? ?? "user",
      rank: json['rank'] as String? ?? "Member",
      verified: json['verified'] as bool? ?? false,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'rank': instance.rank,
      'verified': instance.verified,
      'phone': instance.phone,
      'address': instance.address,
      'avatar': instance.avatar,
      'totalSpent': instance.totalSpent,
    };
