// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailHash() => r'fdb0925b4b2a06197791fe342003560acc249300';

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

/// See also [productDetail].
@ProviderFor(productDetail)
const productDetailProvider = ProductDetailFamily();

/// See also [productDetail].
class ProductDetailFamily extends Family<AsyncValue<ProductEntity>> {
  /// See also [productDetail].
  const ProductDetailFamily();

  /// See also [productDetail].
  ProductDetailProvider call(String id) {
    return ProductDetailProvider(id);
  }

  @override
  ProductDetailProvider getProviderOverride(
    covariant ProductDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailProvider';
}

/// See also [productDetail].
class ProductDetailProvider extends AutoDisposeFutureProvider<ProductEntity> {
  /// See also [productDetail].
  ProductDetailProvider(String id)
    : this._internal(
        (ref) => productDetail(ref as ProductDetailRef, id),
        from: productDetailProvider,
        name: r'productDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productDetailHash,
        dependencies: ProductDetailFamily._dependencies,
        allTransitiveDependencies:
            ProductDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProductDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProductEntity> Function(ProductDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailProvider._internal(
        (ref) => create(ref as ProductDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductEntity> createElement() {
    return _ProductDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductDetailRef on AutoDisposeFutureProviderRef<ProductEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProductEntity>
    with ProductDetailRef {
  _ProductDetailProviderElement(super.provider);

  @override
  String get id => (origin as ProductDetailProvider).id;
}

String _$relatedProductsHash() => r'2a1d3e099c7d7d168ba77256a08dd0a8069a09e7';

/// See also [relatedProducts].
@ProviderFor(relatedProducts)
const relatedProductsProvider = RelatedProductsFamily();

/// See also [relatedProducts].
class RelatedProductsFamily extends Family<AsyncValue<List<ProductEntity>>> {
  /// See also [relatedProducts].
  const RelatedProductsFamily();

  /// See also [relatedProducts].
  RelatedProductsProvider call(String productId, String categoryId) {
    return RelatedProductsProvider(productId, categoryId);
  }

  @override
  RelatedProductsProvider getProviderOverride(
    covariant RelatedProductsProvider provider,
  ) {
    return call(provider.productId, provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'relatedProductsProvider';
}

/// See also [relatedProducts].
class RelatedProductsProvider
    extends AutoDisposeFutureProvider<List<ProductEntity>> {
  /// See also [relatedProducts].
  RelatedProductsProvider(String productId, String categoryId)
    : this._internal(
        (ref) =>
            relatedProducts(ref as RelatedProductsRef, productId, categoryId),
        from: relatedProductsProvider,
        name: r'relatedProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$relatedProductsHash,
        dependencies: RelatedProductsFamily._dependencies,
        allTransitiveDependencies:
            RelatedProductsFamily._allTransitiveDependencies,
        productId: productId,
        categoryId: categoryId,
      );

  RelatedProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
    required this.categoryId,
  }) : super.internal();

  final String productId;
  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<List<ProductEntity>> Function(RelatedProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RelatedProductsProvider._internal(
        (ref) => create(ref as RelatedProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductEntity>> createElement() {
    return _RelatedProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RelatedProductsProvider &&
        other.productId == productId &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RelatedProductsRef on AutoDisposeFutureProviderRef<List<ProductEntity>> {
  /// The parameter `productId` of this provider.
  String get productId;

  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _RelatedProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductEntity>>
    with RelatedProductsRef {
  _RelatedProductsProviderElement(super.provider);

  @override
  String get productId => (origin as RelatedProductsProvider).productId;
  @override
  String get categoryId => (origin as RelatedProductsProvider).categoryId;
}

String _$productReviewsNotifierHash() =>
    r'921da02ece520dbeee157e72817d969ccea1002b';

abstract class _$ProductReviewsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<ReviewEntity>> {
  late final String productId;

  FutureOr<List<ReviewEntity>> build(String productId);
}

/// See also [ProductReviewsNotifier].
@ProviderFor(ProductReviewsNotifier)
const productReviewsNotifierProvider = ProductReviewsNotifierFamily();

/// See also [ProductReviewsNotifier].
class ProductReviewsNotifierFamily
    extends Family<AsyncValue<List<ReviewEntity>>> {
  /// See also [ProductReviewsNotifier].
  const ProductReviewsNotifierFamily();

  /// See also [ProductReviewsNotifier].
  ProductReviewsNotifierProvider call(String productId) {
    return ProductReviewsNotifierProvider(productId);
  }

  @override
  ProductReviewsNotifierProvider getProviderOverride(
    covariant ProductReviewsNotifierProvider provider,
  ) {
    return call(provider.productId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productReviewsNotifierProvider';
}

/// See also [ProductReviewsNotifier].
class ProductReviewsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProductReviewsNotifier,
          List<ReviewEntity>
        > {
  /// See also [ProductReviewsNotifier].
  ProductReviewsNotifierProvider(String productId)
    : this._internal(
        () => ProductReviewsNotifier()..productId = productId,
        from: productReviewsNotifierProvider,
        name: r'productReviewsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productReviewsNotifierHash,
        dependencies: ProductReviewsNotifierFamily._dependencies,
        allTransitiveDependencies:
            ProductReviewsNotifierFamily._allTransitiveDependencies,
        productId: productId,
      );

  ProductReviewsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  FutureOr<List<ReviewEntity>> runNotifierBuild(
    covariant ProductReviewsNotifier notifier,
  ) {
    return notifier.build(productId);
  }

  @override
  Override overrideWith(ProductReviewsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductReviewsNotifierProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ProductReviewsNotifier,
    List<ReviewEntity>
  >
  createElement() {
    return _ProductReviewsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsNotifierProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductReviewsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<ReviewEntity>> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductReviewsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProductReviewsNotifier,
          List<ReviewEntity>
        >
    with ProductReviewsNotifierRef {
  _ProductReviewsNotifierProviderElement(super.provider);

  @override
  String get productId => (origin as ProductReviewsNotifierProvider).productId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
