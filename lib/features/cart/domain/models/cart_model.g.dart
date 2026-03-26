// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$CartStatsImplImpl _$$$CartStatsImplImplFromJson(Map<String, dynamic> json) =>
    _$$CartStatsImplImpl(
      totalOriginalPrice:
          (json['totalOriginalPrice'] as num?)?.toDouble() ?? 0.0,
      totalFinalPrice: (json['totalFinalPrice'] as num?)?.toDouble() ?? 0.0,
      totalDiscount: (json['totalDiscount'] as num?)?.toDouble() ?? 0.0,
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$$CartStatsImplImplToJson(
  _$$CartStatsImplImpl instance,
) => <String, dynamic>{
  'totalOriginalPrice': instance.totalOriginalPrice,
  'totalFinalPrice': instance.totalFinalPrice,
  'totalDiscount': instance.totalDiscount,
  'itemCount': instance.itemCount,
};

_$$CartItemEntityImplImpl _$$$CartItemEntityImplImplFromJson(
  Map<String, dynamic> json,
) => _$$CartItemEntityImplImpl(
  id: json['_id'] as String?,
  product: ProductEntity.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$$$CartItemEntityImplImplToJson(
  _$$CartItemEntityImplImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'product': instance.product,
  'quantity': instance.quantity,
};

_$$CartResponseImplImpl _$$$CartResponseImplImplFromJson(
  Map<String, dynamic> json,
) => _$$CartResponseImplImpl(
  id: json['_id'] as String?,
  user: json['user'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartItemEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cartStats: CartStats.fromJson(json['cartStats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$$CartResponseImplImplToJson(
  _$$CartResponseImplImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'items': instance.items,
  'cartStats': instance.cartStats,
};
