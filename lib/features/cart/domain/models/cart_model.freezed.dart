// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartStats _$CartStatsFromJson(Map<String, dynamic> json) {
  return _$CartStatsImpl.fromJson(json);
}

/// @nodoc
mixin _$CartStats {
  double get totalOriginalPrice => throw _privateConstructorUsedError;
  double get totalFinalPrice => throw _privateConstructorUsedError;
  double get totalDiscount => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;

  /// Serializes this CartStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStatsCopyWith<CartStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStatsCopyWith<$Res> {
  factory $CartStatsCopyWith(CartStats value, $Res Function(CartStats) then) =
      _$CartStatsCopyWithImpl<$Res, CartStats>;
  @useResult
  $Res call({
    double totalOriginalPrice,
    double totalFinalPrice,
    double totalDiscount,
    int itemCount,
  });
}

/// @nodoc
class _$CartStatsCopyWithImpl<$Res, $Val extends CartStats>
    implements $CartStatsCopyWith<$Res> {
  _$CartStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOriginalPrice = null,
    Object? totalFinalPrice = null,
    Object? totalDiscount = null,
    Object? itemCount = null,
  }) {
    return _then(
      _value.copyWith(
            totalOriginalPrice: null == totalOriginalPrice
                ? _value.totalOriginalPrice
                : totalOriginalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            totalFinalPrice: null == totalFinalPrice
                ? _value.totalFinalPrice
                : totalFinalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            totalDiscount: null == totalDiscount
                ? _value.totalDiscount
                : totalDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            itemCount: null == itemCount
                ? _value.itemCount
                : itemCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$$CartStatsImplImplCopyWith<$Res>
    implements $CartStatsCopyWith<$Res> {
  factory _$$$CartStatsImplImplCopyWith(
    _$$CartStatsImplImpl value,
    $Res Function(_$$CartStatsImplImpl) then,
  ) = __$$$CartStatsImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalOriginalPrice,
    double totalFinalPrice,
    double totalDiscount,
    int itemCount,
  });
}

/// @nodoc
class __$$$CartStatsImplImplCopyWithImpl<$Res>
    extends _$CartStatsCopyWithImpl<$Res, _$$CartStatsImplImpl>
    implements _$$$CartStatsImplImplCopyWith<$Res> {
  __$$$CartStatsImplImplCopyWithImpl(
    _$$CartStatsImplImpl _value,
    $Res Function(_$$CartStatsImplImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOriginalPrice = null,
    Object? totalFinalPrice = null,
    Object? totalDiscount = null,
    Object? itemCount = null,
  }) {
    return _then(
      _$$CartStatsImplImpl(
        totalOriginalPrice: null == totalOriginalPrice
            ? _value.totalOriginalPrice
            : totalOriginalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        totalFinalPrice: null == totalFinalPrice
            ? _value.totalFinalPrice
            : totalFinalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        totalDiscount: null == totalDiscount
            ? _value.totalDiscount
            : totalDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        itemCount: null == itemCount
            ? _value.itemCount
            : itemCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$CartStatsImplImpl implements _$CartStatsImpl {
  const _$$CartStatsImplImpl({
    this.totalOriginalPrice = 0.0,
    this.totalFinalPrice = 0.0,
    this.totalDiscount = 0.0,
    this.itemCount = 0,
  });

  factory _$$CartStatsImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$$CartStatsImplImplFromJson(json);

  @override
  @JsonKey()
  final double totalOriginalPrice;
  @override
  @JsonKey()
  final double totalFinalPrice;
  @override
  @JsonKey()
  final double totalDiscount;
  @override
  @JsonKey()
  final int itemCount;

  @override
  String toString() {
    return 'CartStats(totalOriginalPrice: $totalOriginalPrice, totalFinalPrice: $totalFinalPrice, totalDiscount: $totalDiscount, itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$CartStatsImplImpl &&
            (identical(other.totalOriginalPrice, totalOriginalPrice) ||
                other.totalOriginalPrice == totalOriginalPrice) &&
            (identical(other.totalFinalPrice, totalFinalPrice) ||
                other.totalFinalPrice == totalFinalPrice) &&
            (identical(other.totalDiscount, totalDiscount) ||
                other.totalDiscount == totalDiscount) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalOriginalPrice,
    totalFinalPrice,
    totalDiscount,
    itemCount,
  );

  /// Create a copy of CartStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$CartStatsImplImplCopyWith<_$$CartStatsImplImpl> get copyWith =>
      __$$$CartStatsImplImplCopyWithImpl<_$$CartStatsImplImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$CartStatsImplImplToJson(this);
  }
}

abstract class _$CartStatsImpl implements CartStats {
  const factory _$CartStatsImpl({
    final double totalOriginalPrice,
    final double totalFinalPrice,
    final double totalDiscount,
    final int itemCount,
  }) = _$$CartStatsImplImpl;

  factory _$CartStatsImpl.fromJson(Map<String, dynamic> json) =
      _$$CartStatsImplImpl.fromJson;

  @override
  double get totalOriginalPrice;
  @override
  double get totalFinalPrice;
  @override
  double get totalDiscount;
  @override
  int get itemCount;

  /// Create a copy of CartStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$CartStatsImplImplCopyWith<_$$CartStatsImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemEntity _$CartItemEntityFromJson(Map<String, dynamic> json) {
  return _$CartItemEntityImpl.fromJson(json);
}

/// @nodoc
mixin _$CartItemEntity {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  ProductEntity get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemEntityCopyWith<CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEntityCopyWith<$Res> {
  factory $CartItemEntityCopyWith(
    CartItemEntity value,
    $Res Function(CartItemEntity) then,
  ) = _$CartItemEntityCopyWithImpl<$Res, CartItemEntity>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    ProductEntity product,
    int quantity,
  });

  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res, $Val extends CartItemEntity>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            product: null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ProductEntity,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$CartItemEntityImplImplCopyWith<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  factory _$$$CartItemEntityImplImplCopyWith(
    _$$CartItemEntityImplImpl value,
    $Res Function(_$$CartItemEntityImplImpl) then,
  ) = __$$$CartItemEntityImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    ProductEntity product,
    int quantity,
  });

  @override
  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$$$CartItemEntityImplImplCopyWithImpl<$Res>
    extends _$CartItemEntityCopyWithImpl<$Res, _$$CartItemEntityImplImpl>
    implements _$$$CartItemEntityImplImplCopyWith<$Res> {
  __$$$CartItemEntityImplImplCopyWithImpl(
    _$$CartItemEntityImplImpl _value,
    $Res Function(_$$CartItemEntityImplImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(
      _$$CartItemEntityImplImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        product: null == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as ProductEntity,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$CartItemEntityImplImpl implements _$CartItemEntityImpl {
  const _$$CartItemEntityImplImpl({
    @JsonKey(name: '_id') this.id,
    required this.product,
    required this.quantity,
  });

  factory _$$CartItemEntityImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$$CartItemEntityImplImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ProductEntity product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartItemEntity(id: $id, product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$CartItemEntityImplImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, quantity);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$CartItemEntityImplImplCopyWith<_$$CartItemEntityImplImpl> get copyWith =>
      __$$$CartItemEntityImplImplCopyWithImpl<_$$CartItemEntityImplImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$CartItemEntityImplImplToJson(this);
  }
}

abstract class _$CartItemEntityImpl implements CartItemEntity {
  const factory _$CartItemEntityImpl({
    @JsonKey(name: '_id') final String? id,
    required final ProductEntity product,
    required final int quantity,
  }) = _$$CartItemEntityImplImpl;

  factory _$CartItemEntityImpl.fromJson(Map<String, dynamic> json) =
      _$$CartItemEntityImplImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  ProductEntity get product;
  @override
  int get quantity;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$CartItemEntityImplImplCopyWith<_$$CartItemEntityImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _$CartResponseImpl.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  List<CartItemEntity> get items => throw _privateConstructorUsedError;
  CartStats get cartStats => throw _privateConstructorUsedError;

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
    CartResponse value,
    $Res Function(CartResponse) then,
  ) = _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? user,
    List<CartItemEntity> items,
    CartStats cartStats,
  });

  $CartStatsCopyWith<$Res> get cartStats;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? items = null,
    Object? cartStats = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CartItemEntity>,
            cartStats: null == cartStats
                ? _value.cartStats
                : cartStats // ignore: cast_nullable_to_non_nullable
                      as CartStats,
          )
          as $Val,
    );
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartStatsCopyWith<$Res> get cartStats {
    return $CartStatsCopyWith<$Res>(_value.cartStats, (value) {
      return _then(_value.copyWith(cartStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$CartResponseImplImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$$CartResponseImplImplCopyWith(
    _$$CartResponseImplImpl value,
    $Res Function(_$$CartResponseImplImpl) then,
  ) = __$$$CartResponseImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? user,
    List<CartItemEntity> items,
    CartStats cartStats,
  });

  @override
  $CartStatsCopyWith<$Res> get cartStats;
}

/// @nodoc
class __$$$CartResponseImplImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$$CartResponseImplImpl>
    implements _$$$CartResponseImplImplCopyWith<$Res> {
  __$$$CartResponseImplImplCopyWithImpl(
    _$$CartResponseImplImpl _value,
    $Res Function(_$$CartResponseImplImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? items = null,
    Object? cartStats = null,
  }) {
    return _then(
      _$$CartResponseImplImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItemEntity>,
        cartStats: null == cartStats
            ? _value.cartStats
            : cartStats // ignore: cast_nullable_to_non_nullable
                  as CartStats,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$CartResponseImplImpl implements _$CartResponseImpl {
  const _$$CartResponseImplImpl({
    @JsonKey(name: '_id') this.id,
    this.user,
    final List<CartItemEntity> items = const [],
    required this.cartStats,
  }) : _items = items;

  factory _$$CartResponseImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$$CartResponseImplImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? user;
  final List<CartItemEntity> _items;
  @override
  @JsonKey()
  List<CartItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CartStats cartStats;

  @override
  String toString() {
    return 'CartResponse(id: $id, user: $user, items: $items, cartStats: $cartStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$CartResponseImplImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.cartStats, cartStats) ||
                other.cartStats == cartStats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    user,
    const DeepCollectionEquality().hash(_items),
    cartStats,
  );

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$CartResponseImplImplCopyWith<_$$CartResponseImplImpl> get copyWith =>
      __$$$CartResponseImplImplCopyWithImpl<_$$CartResponseImplImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$CartResponseImplImplToJson(this);
  }
}

abstract class _$CartResponseImpl implements CartResponse {
  const factory _$CartResponseImpl({
    @JsonKey(name: '_id') final String? id,
    final String? user,
    final List<CartItemEntity> items,
    required final CartStats cartStats,
  }) = _$$CartResponseImplImpl;

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =
      _$$CartResponseImplImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get user;
  @override
  List<CartItemEntity> get items;
  @override
  CartStats get cartStats;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$CartResponseImplImplCopyWith<_$$CartResponseImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
