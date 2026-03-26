import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String url,
    @JsonKey(name: 'public_id') String? publicId,
  }) = _$ProductImageImpl;

  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
}

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? slug,
    String? sku,
    String? brand,
    required double price,
    String? description,
    @Default(0.0) double salePrice,
    @Default(0) int discountPercent,
    @Default(0.0) double finalPrice,
    @Default(false) bool isOnSale,
    @Default(0) int stock,
    @Default("phan") String unit,
    @Default(0) int sold,
    @Default(4.5) double ratingsAverage,
    @Default(0) int ratingsQuantity,
    @Default([]) List<ProductImage> images,
    @Default(true) bool isPublished,
    DateTime? createdAt, // ĐẢM BẢO TRƯỜNG NÀY CÓ Ở ĐÂY
    DateTime? updatedAt,
  }) = _$ProductEntityImpl;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);
}