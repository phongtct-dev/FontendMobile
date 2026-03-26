import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../home/data/repositories/home_repository_impl.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/models/review.dart'; // Đảm bảo đường dẫn này đúng

part 'product_detail_provider.g.dart';

@riverpod
Future<ProductEntity> productDetail(ProductDetailRef ref, String id) async {
  final repo = ref.watch(homeRepositoryProvider);
  return repo.fetchProductById(id);
}

// Hàm này để hiện sản phẩm liên quan ở cuối trang
@riverpod
Future<List<ProductEntity>> relatedProducts(RelatedProductsRef ref, String productId, String categoryId) async {
  final repo = ref.watch(homeRepositoryProvider);
  return repo.fetchRelatedProducts(productId, categoryId);
}

@riverpod
class ProductReviewsNotifier extends _$ProductReviewsNotifier {
  int _currentPage = 1;
  bool _hasNextPage = true;

  @override
  FutureOr<List<ReviewEntity>> build(String productId) async {
    return _fetch(page: 1);
  }

  Future<List<ReviewEntity>> _fetch({required int page}) async {
    final repo = ref.read(homeRepositoryProvider);
    return repo.fetchProductReviews(productId, page: page);
  }

  Future<void> loadMore() async {
    if (state.isLoading || !_hasNextPage) return;

    _currentPage++;
    final newReviews = await _fetch(page: _currentPage);

    if (newReviews.length < 10) _hasNextPage = false;

    final previousState = state.value ?? [];
    state = AsyncValue.data([...previousState, ...newReviews]);
  }
}