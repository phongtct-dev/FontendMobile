import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../shop/domain/models/review.dart';
import '../../domain/entities/home_data.dart';
import '../../../product/domain/entities/product.dart';

part 'home_repository_impl.g.dart';

class HomeRepository {
  final Dio _dio;
  HomeRepository(this._dio);

  // 1. Lấy danh mục (Đã thêm lại hàm này để HomeNotifier không báo lỗi)
  Future<List<CategoryEntity>> fetchCategories() async {
    final response = await _dio.get('/category');
    final List list = response.data['data']['categories'];
    return list.map((e) => CategoryEntity.fromJson(e)).toList();
  }

  // 2. Lấy sản phẩm (Gộp lại thành 1 hàm duy nhất, hỗ trợ cả Home và Shop)
  Future<List<ProductEntity>> fetchHomeProducts({
    Map<String, dynamic>? queryParameters,
    String? sort,
    int limit = 10,
  }) async {
    final Map<String, dynamic> params = {
      'sort': sort ?? '-createdAt',
      'limit': limit,
    };

    if (queryParameters != null) {
      params.addAll(queryParameters);
    }

    final response = await _dio.get(
      '/product',
      queryParameters: params,
    );

    final List list = response.data['data']['products'];
    return list.map((e) => ProductEntity.fromJson(e)).toList();
  }

  // 1. Lấy chi tiết sản phẩm theo ID
  Future<ProductEntity> fetchProductById(String id) async {
    final response = await _dio.get('/product/$id');
    return ProductEntity.fromJson(response.data['data']);
  }

// 2. Lấy sản phẩm liên quan
  Future<List<ProductEntity>> fetchRelatedProducts(String productId, String categoryId) async {
    final response = await _dio.get(
      '/product',
      queryParameters: {
        'category': categoryId,
        '_id[ne]': productId, // Không lấy chính nó
        'limit': 4,
      },
    );
    final List list = response.data['data']['products'];
    return list.map((e) => ProductEntity.fromJson(e)).toList();
  }


  // review
  Future<List<ReviewEntity>> fetchProductReviews(String productId, {int page = 1}) async {
    final response = await _dio.get(
      '/review/product/$productId',
      queryParameters: {'page': page, 'limit': 10, 'sort': '-createdAt'},
    );




    final List list = response.data['data'];
    return list.map((e) => ReviewEntity.fromJson(e)).toList();
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepository(dio);
}