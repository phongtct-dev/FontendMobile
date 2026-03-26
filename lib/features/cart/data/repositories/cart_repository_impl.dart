import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart'; // Đảm bảo đường dẫn đúng tới Dio của bạn
import '../../domain/models/cart_model.dart';
import '../../domain/models/order_model.dart';

part 'cart_repository_impl.g.dart';

class CartRepository {
  final Dio _dio;
  CartRepository(this._dio);



  Future<CartResponse> getCart() async {
    try {
      print("--- 🛒 FETCHING CART ---");
      final response = await _dio.get('/cart');


      // TEST 3: In toàn bộ JSON để so sánh với Model
      print("Dữ liệu JSON thô: ${response.data}");

      return CartResponse.fromJson(response.data['data']);
    } catch (e,stack) {
      print("CHI TIẾT LỖI PARSE: $e");
      print("VỊ TRÍ LỖI: $stack"); // Dòng này sẽ chỉ đích danh trường nào bị Null
      rethrow;
    }
  }


  Future<CartResponse> addToCart(String productId, int quantity) async {
    final response = await _dio.post('/cart', data: {
      'productId': productId,
      'quantity': quantity,
    });
    return CartResponse.fromJson(response.data['data']);
  }

  // 3. Cập nhật số lượng
  Future<CartResponse> updateCartQuantity(String productId, int quantity) async {
    final response = await _dio.patch('/cart', data: {
      'productId': productId,
      'quantity': quantity,
    });
    return CartResponse.fromJson(response.data['data']);
  }

  // 4. Xóa sản phẩm
  Future<CartResponse> removeFromCart(String productId) async {
    final response = await _dio.delete('/cart/$productId');
    return CartResponse.fromJson(response.data['data']);
  }


  Future<Map<String, dynamic>> checkVoucher(String code) async {
    final response = await _dio.post('/voucher/check', data: {'code': code});
    return response.data['data'];
  }


  Future<Map<String, dynamic>> createOrder(OrderRequest request) async {
    final response = await _dio.post('/order/checkout', data: request.toJson());
    return response.data['data'];
  }



}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return CartRepository(dio);
}