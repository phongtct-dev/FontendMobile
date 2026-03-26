import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/product_filter.dart';
import '../../../product/domain/entities/product.dart';
import '../../../home/data/repositories/home_repository_impl.dart';

part 'shop_provider.g.dart';

@riverpod
class ShopProductNotifier extends _$ShopProductNotifier {
  List<ProductEntity> _allProducts = [];
  // Đảm bảo khởi tạo page mặc định là 1 để tránh lỗi ++ trên giá trị null
  ProductFilter _currentFilter = ProductFilter(page: 1);

  @override
  FutureOr<List<ProductEntity>> build() async {
    _allProducts = await _fetchProducts(_currentFilter);
    return _allProducts;
  }

  // HÀM QUAN TRỌNG NHẤT: Kết nối Repository
  Future<List<ProductEntity>> _fetchProducts(ProductFilter filter) async {
    final repo = ref.read(homeRepositoryProvider);
    // Gọi repo với map parameters từ filter
    return repo.fetchHomeProducts(queryParameters: filter.toMap());
  }

  // Hàm load trang tiếp theo
  Future<void> loadMore() async {
    // Tăng trang (đảm bảo _currentFilter.page không null trong constructor)
    _currentFilter.page++;

    final newProducts = await _fetchProducts(_currentFilter);

    if (newProducts.isNotEmpty) {
      _allProducts.addAll(newProducts); // Cộng dồn vào danh sách cũ
      state = AsyncValue.data(List.from(_allProducts));
    }
  }

  // Hàm áp dụng filter mới (reset về trang 1)
  Future<void> applyFilter(ProductFilter filter) async {
    state = const AsyncLoading();
    _currentFilter = filter;
    _currentFilter.page = 1; // Reset về trang đầu khi lọc
    _allProducts = await _fetchProducts(_currentFilter);
    state = AsyncValue.data(_allProducts);
  }
}