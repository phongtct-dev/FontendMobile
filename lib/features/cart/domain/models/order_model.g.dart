// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderRequestImpl _$$OrderRequestImplFromJson(Map<String, dynamic> json) =>
    _$OrderRequestImpl(
      voucherCode: json['voucherCode'] as String?,
      shippingAddress: ShippingAddress.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      paymentMethod: json['paymentMethod'] as String? ?? "COD",
    );

Map<String, dynamic> _$$OrderRequestImplToJson(_$OrderRequestImpl instance) =>
    <String, dynamic>{
      'voucherCode': instance.voucherCode,
      'shippingAddress': instance.shippingAddress,
      'paymentMethod': instance.paymentMethod,
    };

_$ShippingAddressImpl _$$ShippingAddressImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingAddressImpl(
  fullName: json['fullName'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
);

Map<String, dynamic> _$$ShippingAddressImplToJson(
  _$ShippingAddressImpl instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phone': instance.phone,
  'address': instance.address,
};

_$OrderListResponseImpl _$$OrderListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderListResponseImpl(
  results: (json['results'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OrderListResponseImplToJson(
  _$OrderListResponseImpl instance,
) => <String, dynamic>{
  'results': instance.results,
  'total': instance.total,
  'orders': instance.orders,
};

_$OrderEntityImpl _$$OrderEntityImplFromJson(Map<String, dynamic> json) =>
    _$OrderEntityImpl(
      id: json['_id'] as String,
      user: _parseUser(json['user']),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voucher: json['voucher'] == null
          ? null
          : OrderVoucher.fromJson(json['voucher'] as Map<String, dynamic>),
      totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
      finalAmount: (json['finalAmount'] as num?)?.toDouble() ?? 0,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>,
            ),
      status: json['status'] as String? ?? "PENDING",
      paymentMethod: json['paymentMethod'] as String? ?? "COD",
      paymentStatus: json['paymentStatus'] as String? ?? "UNPAID",
      statusHistory:
          (json['statusHistory'] as List<dynamic>?)
              ?.map(
                (e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderEntityImplToJson(_$OrderEntityImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'items': instance.items,
      'voucher': instance.voucher,
      'totalProductPrice': instance.totalProductPrice,
      'finalAmount': instance.finalAmount,
      'shippingAddress': instance.shippingAddress,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'statusHistory': instance.statusHistory,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$OrderItemEntityImpl _$$OrderItemEntityImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemEntityImpl(
  id: json['_id'] as String?,
  product: _parseProduct(json['product']),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble() ?? 0,
  salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$OrderItemEntityImplToJson(
  _$OrderItemEntityImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'product': instance.product,
  'name': instance.name,
  'price': instance.price,
  'salePrice': instance.salePrice,
  'quantity': instance.quantity,
};

_$OrderVoucherImpl _$$OrderVoucherImplFromJson(Map<String, dynamic> json) =>
    _$OrderVoucherImpl(
      code: json['code'] as String?,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderVoucherImplToJson(_$OrderVoucherImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'discountAmount': instance.discountAmount,
    };

_$OrderStatusHistoryImpl _$$OrderStatusHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$OrderStatusHistoryImpl(
  id: json['_id'] as String?,
  status: json['status'] as String?,
  note: json['note'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$OrderStatusHistoryImplToJson(
  _$OrderStatusHistoryImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'status': instance.status,
  'note': instance.note,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
