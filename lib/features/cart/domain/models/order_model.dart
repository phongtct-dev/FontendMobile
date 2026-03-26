import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

// --- PHẦN GỬI ĐI (REQUEST) ---

@freezed
class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    String? voucherCode,
    required ShippingAddress shippingAddress,
    @Default("COD") String paymentMethod,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);
}

@freezed
class ShippingAddress with _$ShippingAddress {
  const factory ShippingAddress({
    required String fullName,
    required String phone,
    required String address,
  }) = _ShippingAddress;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => _$ShippingAddressFromJson(json);
}

// --- PHẦN NHẬN VỀ (RESPONSE) ---

@freezed
class OrderListResponse with _$OrderListResponse {
  const factory OrderListResponse({
    @Default(0) int results,
    @Default(0) int total,
    @Default([]) List<OrderEntity> orders,
  }) = _OrderListResponse;

  factory OrderListResponse.fromJson(Map<String, dynamic> json) => _$OrderListResponseFromJson(json);
}

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    @JsonKey(name: '_id') required String id,

    // CUSTOM PARSER CHO USER (Xử lý String ID hoặc Object)
    @JsonKey(fromJson: _parseUser) dynamic user,

    @Default([]) List<OrderItemEntity> items,
    OrderVoucher? voucher,
    @Default(0) double totalProductPrice,
    @Default(0) double finalAmount,
    ShippingAddress? shippingAddress,
    @Default("PENDING") String status,
    @Default("COD") String paymentMethod,
    @Default("UNPAID") String paymentStatus,
    @Default([]) List<OrderStatusHistory> statusHistory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, dynamic> json) => _$OrderEntityFromJson(json);
}

@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    @JsonKey(name: '_id') String? id,

    // CUSTOM PARSER CHO PRODUCT (Xử lý String ID hoặc Object)
    @JsonKey(fromJson: _parseProduct) dynamic product,

    String? name,
    @Default(0) double price,
    @Default(0) double salePrice,
    @Default(1) int quantity,
  }) = _OrderItemEntity;

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) => _$OrderItemEntityFromJson(json);
}

@freezed
class OrderVoucher with _$OrderVoucher {
  const factory OrderVoucher({
    String? code,
    @Default(0) double discountAmount,
  }) = _OrderVoucher;

  factory OrderVoucher.fromJson(Map<String, dynamic> json) => _$OrderVoucherFromJson(json);
}

@freezed
class OrderStatusHistory with _$OrderStatusHistory {
  const factory OrderStatusHistory({
    @JsonKey(name: '_id') String? id,
    String? status,
    String? note,
    DateTime? updatedAt,
  }) = _OrderStatusHistory;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) => _$OrderStatusHistoryFromJson(json);
}

// --- CÁC HÀM CUSTOM PARSER ---

dynamic _parseUser(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is Map<String, dynamic>) return value;
  return value;
}

dynamic _parseProduct(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is Map<String, dynamic>) return value;
  return value;
}