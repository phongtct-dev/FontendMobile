import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../product/domain/entities/product.dart';
 // Đảm bảo bạn đã có file này

part 'home_data.freezed.dart';
part 'home_data.g.dart';

@freezed
class BannerEntity with _$BannerEntity {
  const factory BannerEntity({
    required int id,
    required String title,
    required String subtitle,
    required String image,
    required String link,
    required String type,
  }) = _BannerEntity;

  factory BannerEntity.fromJson(Map<String, dynamic> json) => _$BannerEntityFromJson(json);
}

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String image,
    @Default(0) int productCount,
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);
}

@freezed
class HomeStateData with _$HomeStateData {
  const factory HomeStateData({
    required List<BannerEntity> banners,
    required List<CategoryEntity> categories,
    required List<ProductEntity> newArrivals,
    required List<ProductEntity> bestSellers,
  }) = _HomeStateData;
}