import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/models/order_model.dart';

part 'order_repository_impl.g.dart';

class OrderRepository {
  final Dio _dio;
  OrderRepository(this._dio);

  Future<OrderListResponse> getMyOrders({int page = 1, int limit = 10, String? status}) async {
    final Map<String, dynamic> queryParams = {
      'page': page,
      'limit': limit,
      'sort': '-createdAt', // Sắp xếp mới nhất đưa lên đầu
    };

    // Chỉ gửi status nếu nó khác null và không phải là 'ALL'
    if (status != null && status.isNotEmpty && status != 'ALL') {
      queryParams['status'] = status;
    }

    final response = await _dio.get('/order/my-orders', queryParameters: queryParams);
    return OrderListResponse.fromJson(response.data['data']);
  }

  Future<OrderEntity> getOrderDetails(String orderId) async {
    final response = await _dio.get('/order/$orderId');
    return OrderEntity.fromJson(response.data['data']);
  }
}

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return OrderRepository(dio);
}

// --- PROVIDERS CHO UI DÙNG ---

@riverpod
Future<OrderListResponse> myOrdersFuture(MyOrdersFutureRef ref) {
  return ref.watch(orderRepositoryProvider).getMyOrders();
}

@riverpod
Future<OrderEntity> orderDetailFuture(OrderDetailFutureRef ref, String orderId) {
  return ref.watch(orderRepositoryProvider).getOrderDetails(orderId);
}