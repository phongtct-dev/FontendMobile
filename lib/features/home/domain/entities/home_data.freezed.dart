// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) {
  return _BannerEntity.fromJson(json);
}

/// @nodoc
mixin _$BannerEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this BannerEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerEntityCopyWith<BannerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEntityCopyWith<$Res> {
  factory $BannerEntityCopyWith(
    BannerEntity value,
    $Res Function(BannerEntity) then,
  ) = _$BannerEntityCopyWithImpl<$Res, BannerEntity>;
  @useResult
  $Res call({
    int id,
    String title,
    String subtitle,
    String image,
    String link,
    String type,
  });
}

/// @nodoc
class _$BannerEntityCopyWithImpl<$Res, $Val extends BannerEntity>
    implements $BannerEntityCopyWith<$Res> {
  _$BannerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? image = null,
    Object? link = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            link: null == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerEntityImplCopyWith<$Res>
    implements $BannerEntityCopyWith<$Res> {
  factory _$$BannerEntityImplCopyWith(
    _$BannerEntityImpl value,
    $Res Function(_$BannerEntityImpl) then,
  ) = __$$BannerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String subtitle,
    String image,
    String link,
    String type,
  });
}

/// @nodoc
class __$$BannerEntityImplCopyWithImpl<$Res>
    extends _$BannerEntityCopyWithImpl<$Res, _$BannerEntityImpl>
    implements _$$BannerEntityImplCopyWith<$Res> {
  __$$BannerEntityImplCopyWithImpl(
    _$BannerEntityImpl _value,
    $Res Function(_$BannerEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? image = null,
    Object? link = null,
    Object? type = null,
  }) {
    return _then(
      _$BannerEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: null == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        link: null == link
            ? _value.link
            : link // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerEntityImpl implements _BannerEntity {
  const _$BannerEntityImpl({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.link,
    required this.type,
  });

  factory _$BannerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String image;
  @override
  final String link;
  @override
  final String type;

  @override
  String toString() {
    return 'BannerEntity(id: $id, title: $title, subtitle: $subtitle, image: $image, link: $link, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, image, link, type);

  /// Create a copy of BannerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerEntityImplCopyWith<_$BannerEntityImpl> get copyWith =>
      __$$BannerEntityImplCopyWithImpl<_$BannerEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerEntityImplToJson(this);
  }
}

abstract class _BannerEntity implements BannerEntity {
  const factory _BannerEntity({
    required final int id,
    required final String title,
    required final String subtitle,
    required final String image,
    required final String link,
    required final String type,
  }) = _$BannerEntityImpl;

  factory _BannerEntity.fromJson(Map<String, dynamic> json) =
      _$BannerEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get image;
  @override
  String get link;
  @override
  String get type;

  /// Create a copy of BannerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerEntityImplCopyWith<_$BannerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) {
  return _CategoryEntity.fromJson(json);
}

/// @nodoc
mixin _$CategoryEntity {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get productCount => throw _privateConstructorUsedError;

  /// Serializes this CategoryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryEntityCopyWith<CategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityCopyWith(
    CategoryEntity value,
    $Res Function(CategoryEntity) then,
  ) = _$CategoryEntityCopyWithImpl<$Res, CategoryEntity>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String image,
    int productCount,
  });
}

/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res, $Val extends CategoryEntity>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? productCount = null,
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
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            productCount: null == productCount
                ? _value.productCount
                : productCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryEntityImplCopyWith<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  factory _$$CategoryEntityImplCopyWith(
    _$CategoryEntityImpl value,
    $Res Function(_$CategoryEntityImpl) then,
  ) = __$$CategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String image,
    int productCount,
  });
}

/// @nodoc
class __$$CategoryEntityImplCopyWithImpl<$Res>
    extends _$CategoryEntityCopyWithImpl<$Res, _$CategoryEntityImpl>
    implements _$$CategoryEntityImplCopyWith<$Res> {
  __$$CategoryEntityImplCopyWithImpl(
    _$CategoryEntityImpl _value,
    $Res Function(_$CategoryEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? productCount = null,
  }) {
    return _then(
      _$CategoryEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        productCount: null == productCount
            ? _value.productCount
            : productCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryEntityImpl implements _CategoryEntity {
  const _$CategoryEntityImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    required this.image,
    this.productCount = 0,
  });

  factory _$CategoryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryEntityImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  @JsonKey()
  final int productCount;

  @override
  String toString() {
    return 'CategoryEntity(id: $id, name: $name, image: $image, productCount: $productCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, productCount);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      __$$CategoryEntityImplCopyWithImpl<_$CategoryEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryEntityImplToJson(this);
  }
}

abstract class _CategoryEntity implements CategoryEntity {
  const factory _CategoryEntity({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    required final String image,
    final int productCount,
  }) = _$CategoryEntityImpl;

  factory _CategoryEntity.fromJson(Map<String, dynamic> json) =
      _$CategoryEntityImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get image;
  @override
  int get productCount;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeStateData {
  List<BannerEntity> get banners => throw _privateConstructorUsedError;
  List<CategoryEntity> get categories => throw _privateConstructorUsedError;
  List<ProductEntity> get newArrivals => throw _privateConstructorUsedError;
  List<ProductEntity> get bestSellers => throw _privateConstructorUsedError;

  /// Create a copy of HomeStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateDataCopyWith<HomeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateDataCopyWith<$Res> {
  factory $HomeStateDataCopyWith(
    HomeStateData value,
    $Res Function(HomeStateData) then,
  ) = _$HomeStateDataCopyWithImpl<$Res, HomeStateData>;
  @useResult
  $Res call({
    List<BannerEntity> banners,
    List<CategoryEntity> categories,
    List<ProductEntity> newArrivals,
    List<ProductEntity> bestSellers,
  });
}

/// @nodoc
class _$HomeStateDataCopyWithImpl<$Res, $Val extends HomeStateData>
    implements $HomeStateDataCopyWith<$Res> {
  _$HomeStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? categories = null,
    Object? newArrivals = null,
    Object? bestSellers = null,
  }) {
    return _then(
      _value.copyWith(
            banners: null == banners
                ? _value.banners
                : banners // ignore: cast_nullable_to_non_nullable
                      as List<BannerEntity>,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryEntity>,
            newArrivals: null == newArrivals
                ? _value.newArrivals
                : newArrivals // ignore: cast_nullable_to_non_nullable
                      as List<ProductEntity>,
            bestSellers: null == bestSellers
                ? _value.bestSellers
                : bestSellers // ignore: cast_nullable_to_non_nullable
                      as List<ProductEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateDataImplCopyWith<$Res>
    implements $HomeStateDataCopyWith<$Res> {
  factory _$$HomeStateDataImplCopyWith(
    _$HomeStateDataImpl value,
    $Res Function(_$HomeStateDataImpl) then,
  ) = __$$HomeStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<BannerEntity> banners,
    List<CategoryEntity> categories,
    List<ProductEntity> newArrivals,
    List<ProductEntity> bestSellers,
  });
}

/// @nodoc
class __$$HomeStateDataImplCopyWithImpl<$Res>
    extends _$HomeStateDataCopyWithImpl<$Res, _$HomeStateDataImpl>
    implements _$$HomeStateDataImplCopyWith<$Res> {
  __$$HomeStateDataImplCopyWithImpl(
    _$HomeStateDataImpl _value,
    $Res Function(_$HomeStateDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? categories = null,
    Object? newArrivals = null,
    Object? bestSellers = null,
  }) {
    return _then(
      _$HomeStateDataImpl(
        banners: null == banners
            ? _value._banners
            : banners // ignore: cast_nullable_to_non_nullable
                  as List<BannerEntity>,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryEntity>,
        newArrivals: null == newArrivals
            ? _value._newArrivals
            : newArrivals // ignore: cast_nullable_to_non_nullable
                  as List<ProductEntity>,
        bestSellers: null == bestSellers
            ? _value._bestSellers
            : bestSellers // ignore: cast_nullable_to_non_nullable
                  as List<ProductEntity>,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateDataImpl implements _HomeStateData {
  const _$HomeStateDataImpl({
    required final List<BannerEntity> banners,
    required final List<CategoryEntity> categories,
    required final List<ProductEntity> newArrivals,
    required final List<ProductEntity> bestSellers,
  }) : _banners = banners,
       _categories = categories,
       _newArrivals = newArrivals,
       _bestSellers = bestSellers;

  final List<BannerEntity> _banners;
  @override
  List<BannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<CategoryEntity> _categories;
  @override
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ProductEntity> _newArrivals;
  @override
  List<ProductEntity> get newArrivals {
    if (_newArrivals is EqualUnmodifiableListView) return _newArrivals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newArrivals);
  }

  final List<ProductEntity> _bestSellers;
  @override
  List<ProductEntity> get bestSellers {
    if (_bestSellers is EqualUnmodifiableListView) return _bestSellers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bestSellers);
  }

  @override
  String toString() {
    return 'HomeStateData(banners: $banners, categories: $categories, newArrivals: $newArrivals, bestSellers: $bestSellers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateDataImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(
              other._newArrivals,
              _newArrivals,
            ) &&
            const DeepCollectionEquality().equals(
              other._bestSellers,
              _bestSellers,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_banners),
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_newArrivals),
    const DeepCollectionEquality().hash(_bestSellers),
  );

  /// Create a copy of HomeStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateDataImplCopyWith<_$HomeStateDataImpl> get copyWith =>
      __$$HomeStateDataImplCopyWithImpl<_$HomeStateDataImpl>(this, _$identity);
}

abstract class _HomeStateData implements HomeStateData {
  const factory _HomeStateData({
    required final List<BannerEntity> banners,
    required final List<CategoryEntity> categories,
    required final List<ProductEntity> newArrivals,
    required final List<ProductEntity> bestSellers,
  }) = _$HomeStateDataImpl;

  @override
  List<BannerEntity> get banners;
  @override
  List<CategoryEntity> get categories;
  @override
  List<ProductEntity> get newArrivals;
  @override
  List<ProductEntity> get bestSellers;

  /// Create a copy of HomeStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateDataImplCopyWith<_$HomeStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
