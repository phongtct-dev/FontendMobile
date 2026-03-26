import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/domain/entities/product.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartStats with _$CartStats {
  const factory CartStats({
    @Default(0.0) double totalOriginalPrice,
    @Default(0.0) double totalFinalPrice,
    @Default(0.0) double totalDiscount,
    @Default(0) int itemCount,
  }) = _$CartStatsImpl;

  factory CartStats.fromJson(Map<String, dynamic> json) => _$CartStatsFromJson(json);
}

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    @JsonKey(name: '_id') String? id,
    required ProductEntity product,
    required int quantity,
  }) = _$CartItemEntityImpl; // Sửa lại thành tên này

  factory CartItemEntity.fromJson(Map<String, dynamic> json) => _$CartItemEntityFromJson(json);
}

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    @JsonKey(name: '_id') String? id,
    String? user,
    @Default([]) List<CartItemEntity> items,
    required CartStats cartStats,
  }) = _$CartResponseImpl;

  factory CartResponse.fromJson(Map<String, dynamic> json) => _$CartResponseFromJson(json);
}