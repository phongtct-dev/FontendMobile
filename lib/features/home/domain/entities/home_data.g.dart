// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerEntityImpl _$$BannerEntityImplFromJson(Map<String, dynamic> json) =>
    _$BannerEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      image: json['image'] as String,
      link: json['link'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$BannerEntityImplToJson(_$BannerEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image': instance.image,
      'link': instance.link,
      'type': instance.type,
    };

_$CategoryEntityImpl _$$CategoryEntityImplFromJson(Map<String, dynamic> json) =>
    _$CategoryEntityImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CategoryEntityImplToJson(
  _$CategoryEntityImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'productCount': instance.productCount,
};
