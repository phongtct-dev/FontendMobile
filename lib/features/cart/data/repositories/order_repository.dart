




import 'package:dio/dio.dart';

import '../../domain/models/order_model.dart';

class OrderRepository {
  final Dio _dio;
  OrderRepository(this._dio);

  // 1. Kiểm tra Voucher (Dựa trên checkVoucher.js)
  Future<Map<String, dynamic>> checkVoucher(String code) async {
    final response = await _dio.post('/voucher/check', data: {'code': code});
    return response.data['data']; // Trả về discountAmount, finalTotal...
  }

  // 2. Đặt hàng (Dựa trên orderServices.checkout)
  Future<Map<String, dynamic>> createOrder(OrderRequest request) async {
    final response = await _dio.post('/order/checkout', data: request.toJson());
    return response.data['data']; // Trả về order và checkoutUrl (nếu có)
  }
}