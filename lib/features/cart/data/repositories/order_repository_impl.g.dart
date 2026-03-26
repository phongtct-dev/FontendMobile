// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderRepositoryHash() => r'52e1b491431d34624f8817957a9faad7edfc3117';

/// See also [orderRepository].
@ProviderFor(orderRepository)
final orderRepositoryProvider = AutoDisposeProvider<OrderRepository>.internal(
  orderRepository,
  name: r'orderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderRepositoryRef = AutoDisposeProviderRef<OrderRepository>;
String _$myOrdersFutureHash() => r'54164b0c743e199ccc3b9aa3ddb18eac6e393ea4';

/// See also [myOrdersFuture].
@ProviderFor(myOrdersFuture)
final myOrdersFutureProvider =
    AutoDisposeFutureProvider<OrderListResponse>.internal(
      myOrdersFuture,
      name: r'myOrdersFutureProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myOrdersFutureHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyOrdersFutureRef = AutoDisposeFutureProviderRef<OrderListResponse>;
String _$orderDetailFutureHash() => r'32e5a9c1a9954e209cebc628a0bd78641c17d30d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [orderDetailFuture].
@ProviderFor(orderDetailFuture)
const orderDetailFutureProvider = OrderDetailFutureFamily();

/// See also [orderDetailFuture].
class OrderDetailFutureFamily extends Family<AsyncValue<OrderEntity>> {
  /// See also [orderDetailFuture].
  const OrderDetailFutureFamily();

  /// See also [orderDetailFuture].
  OrderDetailFutureProvider call(String orderId) {
    return OrderDetailFutureProvider(orderId);
  }

  @override
  OrderDetailFutureProvider getProviderOverride(
    covariant OrderDetailFutureProvider provider,
  ) {
    return call(provider.orderId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderDetailFutureProvider';
}

/// See also [orderDetailFuture].
class OrderDetailFutureProvider extends AutoDisposeFutureProvider<OrderEntity> {
  /// See also [orderDetailFuture].
  OrderDetailFutureProvider(String orderId)
    : this._internal(
        (ref) => orderDetailFuture(ref as OrderDetailFutureRef, orderId),
        from: orderDetailFutureProvider,
        name: r'orderDetailFutureProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$orderDetailFutureHash,
        dependencies: OrderDetailFutureFamily._dependencies,
        allTransitiveDependencies:
            OrderDetailFutureFamily._allTransitiveDependencies,
        orderId: orderId,
      );

  OrderDetailFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<OrderEntity> Function(OrderDetailFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrderDetailFutureProvider._internal(
        (ref) => create(ref as OrderDetailFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderEntity> createElement() {
    return _OrderDetailFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDetailFutureProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrderDetailFutureRef on AutoDisposeFutureProviderRef<OrderEntity> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _OrderDetailFutureProviderElement
    extends AutoDisposeFutureProviderElement<OrderEntity>
    with OrderDetailFutureRef {
  _OrderDetailFutureProviderElement(super.provider);

  @override
  String get orderId => (origin as OrderDetailFutureProvider).orderId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
