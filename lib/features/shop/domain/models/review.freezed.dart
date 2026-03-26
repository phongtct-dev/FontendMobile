// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) {
  return _ReviewUser.fromJson(json);
}

/// @nodoc
mixin _$ReviewUser {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this ReviewUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewUserCopyWith<ReviewUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUserCopyWith<$Res> {
  factory $ReviewUserCopyWith(
    ReviewUser value,
    $Res Function(ReviewUser) then,
  ) = _$ReviewUserCopyWithImpl<$Res, ReviewUser>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String fullName, String? avatar});
}

/// @nodoc
class _$ReviewUserCopyWithImpl<$Res, $Val extends ReviewUser>
    implements $ReviewUserCopyWith<$Res> {
  _$ReviewUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? avatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewUserImplCopyWith<$Res>
    implements $ReviewUserCopyWith<$Res> {
  factory _$$ReviewUserImplCopyWith(
    _$ReviewUserImpl value,
    $Res Function(_$ReviewUserImpl) then,
  ) = __$$ReviewUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String fullName, String? avatar});
}

/// @nodoc
class __$$ReviewUserImplCopyWithImpl<$Res>
    extends _$ReviewUserCopyWithImpl<$Res, _$ReviewUserImpl>
    implements _$$ReviewUserImplCopyWith<$Res> {
  __$$ReviewUserImplCopyWithImpl(
    _$ReviewUserImpl _value,
    $Res Function(_$ReviewUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? avatar = freezed,
  }) {
    return _then(
      _$ReviewUserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewUserImpl implements _ReviewUser {
  const _$ReviewUserImpl({
    @JsonKey(name: '_id') required this.id,
    required this.fullName,
    this.avatar,
  });

  factory _$ReviewUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewUserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String fullName;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'ReviewUser(id: $id, fullName: $fullName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, avatar);

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUserImplCopyWith<_$ReviewUserImpl> get copyWith =>
      __$$ReviewUserImplCopyWithImpl<_$ReviewUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewUserImplToJson(this);
  }
}

abstract class _ReviewUser implements ReviewUser {
  const factory _ReviewUser({
    @JsonKey(name: '_id') required final String id,
    required final String fullName,
    final String? avatar,
  }) = _$ReviewUserImpl;

  factory _ReviewUser.fromJson(Map<String, dynamic> json) =
      _$ReviewUserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get fullName;
  @override
  String? get avatar;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewUserImplCopyWith<_$ReviewUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewEntity _$ReviewEntityFromJson(Map<String, dynamic> json) {
  return _ReviewEntity.fromJson(json);
}

/// @nodoc
mixin _$ReviewEntity {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  ReviewUser get user => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ReviewEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewEntityCopyWith<ReviewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEntityCopyWith<$Res> {
  factory $ReviewEntityCopyWith(
    ReviewEntity value,
    $Res Function(ReviewEntity) then,
  ) = _$ReviewEntityCopyWithImpl<$Res, ReviewEntity>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String review,
    double rating,
    ReviewUser user,
    DateTime createdAt,
  });

  $ReviewUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReviewEntityCopyWithImpl<$Res, $Val extends ReviewEntity>
    implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? review = null,
    Object? rating = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            review: null == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as ReviewUser,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserCopyWith<$Res> get user {
    return $ReviewUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewEntityImplCopyWith<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  factory _$$ReviewEntityImplCopyWith(
    _$ReviewEntityImpl value,
    $Res Function(_$ReviewEntityImpl) then,
  ) = __$$ReviewEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String review,
    double rating,
    ReviewUser user,
    DateTime createdAt,
  });

  @override
  $ReviewUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ReviewEntityImplCopyWithImpl<$Res>
    extends _$ReviewEntityCopyWithImpl<$Res, _$ReviewEntityImpl>
    implements _$$ReviewEntityImplCopyWith<$Res> {
  __$$ReviewEntityImplCopyWithImpl(
    _$ReviewEntityImpl _value,
    $Res Function(_$ReviewEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? review = null,
    Object? rating = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ReviewEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        review: null == review
            ? _value.review
            : review // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as ReviewUser,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewEntityImpl implements _ReviewEntity {
  const _$ReviewEntityImpl({
    @JsonKey(name: '_id') required this.id,
    required this.review,
    required this.rating,
    required this.user,
    required this.createdAt,
  });

  factory _$ReviewEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewEntityImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String review;
  @override
  final double rating;
  @override
  final ReviewUser user;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReviewEntity(id: $id, review: $review, rating: $rating, user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, review, rating, user, createdAt);

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewEntityImplCopyWith<_$ReviewEntityImpl> get copyWith =>
      __$$ReviewEntityImplCopyWithImpl<_$ReviewEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewEntityImplToJson(this);
  }
}

abstract class _ReviewEntity implements ReviewEntity {
  const factory _ReviewEntity({
    @JsonKey(name: '_id') required final String id,
    required final String review,
    required final double rating,
    required final ReviewUser user,
    required final DateTime createdAt,
  }) = _$ReviewEntityImpl;

  factory _ReviewEntity.fromJson(Map<String, dynamic> json) =
      _$ReviewEntityImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get review;
  @override
  double get rating;
  @override
  ReviewUser get user;
  @override
  DateTime get createdAt;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewEntityImplCopyWith<_$ReviewEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
