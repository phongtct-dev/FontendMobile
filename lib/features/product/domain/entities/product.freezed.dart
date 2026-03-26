// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return _$ProductImageImpl.fromJson(json);
}

/// @nodoc
mixin _$ProductImage {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_id')
  String? get publicId => throw _privateConstructorUsedError;

  /// Serializes this ProductImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageCopyWith<ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageCopyWith<$Res> {
  factory $ProductImageCopyWith(
    ProductImage value,
    $Res Function(ProductImage) then,
  ) = _$ProductImageCopyWithImpl<$Res, ProductImage>;
  @useResult
  $Res call({String url, @JsonKey(name: 'public_id') String? publicId});
}

/// @nodoc
class _$ProductImageCopyWithImpl<$Res, $Val extends ProductImage>
    implements $ProductImageCopyWith<$Res> {
  _$ProductImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? publicId = freezed}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            publicId: freezed == publicId
                ? _value.publicId
                : publicId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$$ProductImageImplImplCopyWith<$Res>
    implements $ProductImageCopyWith<$Res> {
  factory _$$$ProductImageImplImplCopyWith(
    _$$ProductImageImplImpl value,
    $Res Function(_$$ProductImageImplImpl) then,
  ) = __$$$ProductImageImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, @JsonKey(name: 'public_id') String? publicId});
}

/// @nodoc
class __$$$ProductImageImplImplCopyWithImpl<$Res>
    extends _$ProductImageCopyWithImpl<$Res, _$$ProductImageImplImpl>
    implements _$$$ProductImageImplImplCopyWith<$Res> {
  __$$$ProductImageImplImplCopyWithImpl(
    _$$ProductImageImplImpl _value,
    $Res Function(_$$ProductImageImplImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? publicId = freezed}) {
    return _then(
      _$$ProductImageImplImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        publicId: freezed == publicId
            ? _value.publicId
            : publicId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$ProductImageImplImpl implements _$ProductImageImpl {
  const _$$ProductImageImplImpl({
    required this.url,
    @JsonKey(name: 'public_id') this.publicId,
  });

  factory _$$ProductImageImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$$ProductImageImplImplFromJson(json);

  @override
  final String url;
  @override
  @JsonKey(name: 'public_id')
  final String? publicId;

  @override
  String toString() {
    return 'ProductImage(url: $url, publicId: $publicId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ProductImageImplImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.publicId, publicId) ||
                other.publicId == publicId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, publicId);

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$ProductImageImplImplCopyWith<_$$ProductImageImplImpl> get copyWith =>
      __$$$ProductImageImplImplCopyWithImpl<_$$ProductImageImplImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$ProductImageImplImplToJson(this);
  }
}

abstract class _$ProductImageImpl implements ProductImage {
  const factory _$ProductImageImpl({
    required final String url,
    @JsonKey(name: 'public_id') final String? publicId,
  }) = _$$ProductImageImplImpl;

  factory _$ProductImageImpl.fromJson(Map<String, dynamic> json) =
      _$$ProductImageImplImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'public_id')
  String? get publicId;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$ProductImageImplImplCopyWith<_$$ProductImageImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return _$ProductEntityImpl.fromJson(json);
}

/// @nodoc
mixin _$ProductEntity {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get salePrice => throw _privateConstructorUsedError;
  int get discountPercent => throw _privateConstructorUsedError;
  double get finalPrice => throw _privateConstructorUsedError;
  bool get isOnSale => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get sold => throw _privateConstructorUsedError;
  double get ratingsAverage => throw _privateConstructorUsedError;
  int get ratingsQuantity => throw _privateConstructorUsedError;
  List<ProductImage> get images => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  DateTime? get createdAt =>
      throw _privateConstructorUsedError; // ĐẢM BẢO TRƯỜNG NÀY CÓ Ở ĐÂY
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
    ProductEntity value,
    $Res Function(ProductEntity) then,
  ) = _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? slug,
    String? sku,
    String? brand,
    double price,
    String? description,
    double salePrice,
    int discountPercent,
    double finalPrice,
    bool isOnSale,
    int stock,
    String unit,
    int sold,
    double ratingsAverage,
    int ratingsQuantity,
    List<ProductImage> images,
    bool isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? sku = freezed,
    Object? brand = freezed,
    Object? price = null,
    Object? description = freezed,
    Object? salePrice = null,
    Object? discountPercent = null,
    Object? finalPrice = null,
    Object? isOnSale = null,
    Object? stock = null,
    Object? unit = null,
    Object? sold = null,
    Object? ratingsAverage = null,
    Object? ratingsQuantity = null,
    Object? images = null,
    Object? isPublished = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            slug: freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String?,
            sku: freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                      as String?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            salePrice: null == salePrice
                ? _value.salePrice
                : salePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            discountPercent: null == discountPercent
                ? _value.discountPercent
                : discountPercent // ignore: cast_nullable_to_non_nullable
                      as int,
            finalPrice: null == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            isOnSale: null == isOnSale
                ? _value.isOnSale
                : isOnSale // ignore: cast_nullable_to_non_nullable
                      as bool,
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as int,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            sold: null == sold
                ? _value.sold
                : sold // ignore: cast_nullable_to_non_nullable
                      as int,
            ratingsAverage: null == ratingsAverage
                ? _value.ratingsAverage
                : ratingsAverage // ignore: cast_nullable_to_non_nullable
                      as double,
            ratingsQuantity: null == ratingsQuantity
                ? _value.ratingsQuantity
                : ratingsQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<ProductImage>,
            isPublished: null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$$ProductEntityImplImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$$ProductEntityImplImplCopyWith(
    _$$ProductEntityImplImpl value,
    $Res Function(_$$ProductEntityImplImpl) then,
  ) = __$$$ProductEntityImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? slug,
    String? sku,
    String? brand,
    double price,
    String? description,
    double salePrice,
    int discountPercent,
    double finalPrice,
    bool isOnSale,
    int stock,
    String unit,
    int sold,
    double ratingsAverage,
    int ratingsQuantity,
    List<ProductImage> images,
    bool isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$$ProductEntityImplImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$$ProductEntityImplImpl>
    implements _$$$ProductEntityImplImplCopyWith<$Res> {
  __$$$ProductEntityImplImplCopyWithImpl(
    _$$ProductEntityImplImpl _value,
    $Res Function(_$$ProductEntityImplImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? sku = freezed,
    Object? brand = freezed,
    Object? price = null,
    Object? description = freezed,
    Object? salePrice = null,
    Object? discountPercent = null,
    Object? finalPrice = null,
    Object? isOnSale = null,
    Object? stock = null,
    Object? unit = null,
    Object? sold = null,
    Object? ratingsAverage = null,
    Object? ratingsQuantity = null,
    Object? images = null,
    Object? isPublished = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$$ProductEntityImplImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        slug: freezed == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String?,
        sku: freezed == sku
            ? _value.sku
            : sku // ignore: cast_nullable_to_non_nullable
                  as String?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        salePrice: null == salePrice
            ? _value.salePrice
            : salePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        discountPercent: null == discountPercent
            ? _value.discountPercent
            : discountPercent // ignore: cast_nullable_to_non_nullable
                  as int,
        finalPrice: null == finalPrice
            ? _value.finalPrice
            : finalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        isOnSale: null == isOnSale
            ? _value.isOnSale
            : isOnSale // ignore: cast_nullable_to_non_nullable
                  as bool,
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as int,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        sold: null == sold
            ? _value.sold
            : sold // ignore: cast_nullable_to_non_nullable
                  as int,
        ratingsAverage: null == ratingsAverage
            ? _value.ratingsAverage
            : ratingsAverage // ignore: cast_nullable_to_non_nullable
                  as double,
        ratingsQuantity: null == ratingsQuantity
            ? _value.ratingsQuantity
            : ratingsQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<ProductImage>,
        isPublished: null == isPublished
            ? _value.isPublished
            : isPublished // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$ProductEntityImplImpl implements _$ProductEntityImpl {
  const _$$ProductEntityImplImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    this.slug,
    this.sku,
    this.brand,
    required this.price,
    this.description,
    this.salePrice = 0.0,
    this.discountPercent = 0,
    this.finalPrice = 0.0,
    this.isOnSale = false,
    this.stock = 0,
    this.unit = "phan",
    this.sold = 0,
    this.ratingsAverage = 4.5,
    this.ratingsQuantity = 0,
    final List<ProductImage> images = const [],
    this.isPublished = true,
    this.createdAt,
    this.updatedAt,
  }) : _images = images;

  factory _$$ProductEntityImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$$ProductEntityImplImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? slug;
  @override
  final String? sku;
  @override
  final String? brand;
  @override
  final double price;
  @override
  final String? description;
  @override
  @JsonKey()
  final double salePrice;
  @override
  @JsonKey()
  final int discountPercent;
  @override
  @JsonKey()
  final double finalPrice;
  @override
  @JsonKey()
  final bool isOnSale;
  @override
  @JsonKey()
  final int stock;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey()
  final int sold;
  @override
  @JsonKey()
  final double ratingsAverage;
  @override
  @JsonKey()
  final int ratingsQuantity;
  final List<ProductImage> _images;
  @override
  @JsonKey()
  List<ProductImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool isPublished;
  @override
  final DateTime? createdAt;
  // ĐẢM BẢO TRƯỜNG NÀY CÓ Ở ĐÂY
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, slug: $slug, sku: $sku, brand: $brand, price: $price, description: $description, salePrice: $salePrice, discountPercent: $discountPercent, finalPrice: $finalPrice, isOnSale: $isOnSale, stock: $stock, unit: $unit, sold: $sold, ratingsAverage: $ratingsAverage, ratingsQuantity: $ratingsQuantity, images: $images, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ProductEntityImplImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.isOnSale, isOnSale) ||
                other.isOnSale == isOnSale) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.ratingsAverage, ratingsAverage) ||
                other.ratingsAverage == ratingsAverage) &&
            (identical(other.ratingsQuantity, ratingsQuantity) ||
                other.ratingsQuantity == ratingsQuantity) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    slug,
    sku,
    brand,
    price,
    description,
    salePrice,
    discountPercent,
    finalPrice,
    isOnSale,
    stock,
    unit,
    sold,
    ratingsAverage,
    ratingsQuantity,
    const DeepCollectionEquality().hash(_images),
    isPublished,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$ProductEntityImplImplCopyWith<_$$ProductEntityImplImpl> get copyWith =>
      __$$$ProductEntityImplImplCopyWithImpl<_$$ProductEntityImplImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$ProductEntityImplImplToJson(this);
  }
}

abstract class _$ProductEntityImpl implements ProductEntity {
  const factory _$ProductEntityImpl({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    final String? slug,
    final String? sku,
    final String? brand,
    required final double price,
    final String? description,
    final double salePrice,
    final int discountPercent,
    final double finalPrice,
    final bool isOnSale,
    final int stock,
    final String unit,
    final int sold,
    final double ratingsAverage,
    final int ratingsQuantity,
    final List<ProductImage> images,
    final bool isPublished,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$$ProductEntityImplImpl;

  factory _$ProductEntityImpl.fromJson(Map<String, dynamic> json) =
      _$$ProductEntityImplImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get slug;
  @override
  String? get sku;
  @override
  String? get brand;
  @override
  double get price;
  @override
  String? get description;
  @override
  double get salePrice;
  @override
  int get discountPercent;
  @override
  double get finalPrice;
  @override
  bool get isOnSale;
  @override
  int get stock;
  @override
  String get unit;
  @override
  int get sold;
  @override
  double get ratingsAverage;
  @override
  int get ratingsQuantity;
  @override
  List<ProductImage> get images;
  @override
  bool get isPublished;
  @override
  DateTime? get createdAt; // ĐẢM BẢO TRƯỜNG NÀY CÓ Ở ĐÂY
  @override
  DateTime? get updatedAt;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$ProductEntityImplImplCopyWith<_$$ProductEntityImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
