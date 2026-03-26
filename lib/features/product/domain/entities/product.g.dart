// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$ProductImageImplImpl _$$$ProductImageImplImplFromJson(
  Map<String, dynamic> json,
) => _$$ProductImageImplImpl(
  url: json['url'] as String,
  publicId: json['public_id'] as String?,
);

Map<String, dynamic> _$$$ProductImageImplImplToJson(
  _$$ProductImageImplImpl instance,
) => <String, dynamic>{'url': instance.url, 'public_id': instance.publicId};

_$$ProductEntityImplImpl _$$$ProductEntityImplImplFromJson(
  Map<String, dynamic> json,
) => _$$ProductEntityImplImpl(
  id: json['_id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String?,
  sku: json['sku'] as String?,
  brand: json['brand'] as String?,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String?,
  salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0.0,
  discountPercent: (json['discountPercent'] as num?)?.toInt() ?? 0,
  finalPrice: (json['finalPrice'] as num?)?.toDouble() ?? 0.0,
  isOnSale: json['isOnSale'] as bool? ?? false,
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  unit: json['unit'] as String? ?? "phan",
  sold: (json['sold'] as num?)?.toInt() ?? 0,
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 4.5,
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt() ?? 0,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isPublished: json['isPublished'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$$ProductEntityImplImplToJson(
  _$$ProductEntityImplImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'sku': instance.sku,
  'brand': instance.brand,
  'price': instance.price,
  'description': instance.description,
  'salePrice': instance.salePrice,
  'discountPercent': instance.discountPercent,
  'finalPrice': instance.finalPrice,
  'isOnSale': instance.isOnSale,
  'stock': instance.stock,
  'unit': instance.unit,
  'sold': instance.sold,
  'ratingsAverage': instance.ratingsAverage,
  'ratingsQuantity': instance.ratingsQuantity,
  'images': instance.images,
  'isPublished': instance.isPublished,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
