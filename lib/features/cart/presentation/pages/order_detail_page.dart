import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/models/order_model.dart';
import '../../data/repositories/order_repository_impl.dart';

class OrderDetailPage extends ConsumerWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderDetailFutureProvider(orderId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("Chi tiết đơn hàng", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: orderAsync.when(
        data: (order) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusTimeline(context, order),
                const SizedBox(height: 16),
                _buildShippingInfo(context, order),
                const SizedBox(height: 16),
                _buildOrderItems(context, order),
                const SizedBox(height: 16),
                _buildPaymentSummary(context, order),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Lỗi: $err")),
      ),
    );
  }

  // 1. TIMELINE TRẠNG THÁI
  Widget _buildStatusTimeline(BuildContext context, OrderEntity order) {
    final colorScheme = Theme.of(context).colorScheme;

    // Danh sách các mốc cố định
    final allStatuses = ['PENDING', 'CONFIRMED', 'SHIPPING', 'DELIVERED'];
    if (order.status == 'CANCELLED') allStatuses[1] = 'CANCELLED'; // Đổi nhánh nếu bị hủy

    int currentIndex = allStatuses.indexOf(order.status);
    if (order.status == 'SUCCESS') currentIndex = 3; // Coi SUCCESS như DELIVERED ở vạch cuối

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mã đơn: #${order.id.substring(order.id.length - 8).toUpperCase()}", style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(order.paymentStatus == 'PAID' ? "ĐÃ THANH TOÁN" : "CHƯA THANH TOÁN",
                  style: TextStyle(color: order.paymentStatus == 'PAID' ? Colors.green : Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const Divider(height: 30),

          // Vẽ Timeline
          ...List.generate(allStatuses.length, (index) {
            final isCompleted = index <= currentIndex;
            final isLast = index == allStatuses.length - 1;
            final statusCode = allStatuses[index];

            // Tìm lịch sử ứng với status này
            final historyItem = order.statusHistory.where((h) => h.status == statusCode).lastOrNull;
            final timeStr = historyItem?.updatedAt != null
                ? DateFormat('dd/MM HH:mm').format(historyItem!.updatedAt!)
                : '';

            String title = "";
            switch (statusCode) {
              case 'PENDING': title = "Đơn hàng đã đặt"; break;
              case 'CONFIRMED': title = "Đã xác nhận"; break;
              case 'SHIPPING': title = "Đang giao hàng"; break;
              case 'DELIVERED': case 'SUCCESS': title = "Đã giao thành công"; break;
              case 'CANCELLED': title = "Đã hủy đơn"; break;
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 24, height: 24,
                      decoration: BoxDecoration(
                          color: isCompleted ? colorScheme.primary : colorScheme.surfaceVariant,
                          shape: BoxShape.circle,
                          border: Border.all(color: isCompleted ? colorScheme.primary : colorScheme.outline, width: 2)
                      ),
                      child: isCompleted ? Icon(Icons.check, size: 14, color: colorScheme.onPrimary) : null,
                    ),
                    if (!isLast)
                      Container(width: 2, height: 40, color: isCompleted ? colorScheme.primary : colorScheme.surfaceVariant),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal, color: isCompleted ? colorScheme.onSurface : colorScheme.outline)),
                        if (timeStr.isNotEmpty)
                          Text(timeStr, style: TextStyle(fontSize: 12, color: colorScheme.outline)),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }

  // 2. THÔNG TIN NHẬN HÀNG
  Widget _buildShippingInfo(BuildContext context, OrderEntity order) {
    final colorScheme = Theme.of(context).colorScheme;
    final address = order.shippingAddress;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Địa chỉ nhận hàng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Text(address?.fullName ?? "Không có tên", style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(address?.phone ?? "Không có số điện thoại", style: TextStyle(color: colorScheme.outline)),
          const SizedBox(height: 4),
          Text(address?.address ?? "Không có địa chỉ", style: TextStyle(color: colorScheme.outline)),
        ],
      ),
    );
  }

  // 3. SẢN PHẨM TRONG ĐƠN
  Widget _buildOrderItems(BuildContext context, OrderEntity order) {
    final colorScheme = Theme.of(context).colorScheme;
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sản phẩm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          ...order.items.map((item) {
            // Ép kiểu map vì backend gửi populate("items.product")
            final productData = item.product is Map<String, dynamic> ? item.product as Map<String, dynamic> : null;
            final imageUrl = (productData?['images'] != null && productData!['images'].isNotEmpty)
                ? productData['images'][0]['url']
                : 'https://via.placeholder.com/150';

            final itemName = item.name ?? productData?['name'] ?? "Sản phẩm";

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemName, style: const TextStyle(fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("x${item.quantity}", style: TextStyle(color: colorScheme.outline)),
                            Text(currency.format(item.salePrice > 0 ? item.salePrice : item.price), style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // 4. TỔNG TIỀN
  Widget _buildPaymentSummary(BuildContext context, OrderEntity order) {
    final colorScheme = Theme.of(context).colorScheme;
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Chi tiết thanh toán", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          _priceRow("Tổng tiền hàng", currency.format(order.totalProductPrice), colorScheme),
          if (order.voucher != null)
            _priceRow("Voucher giảm giá", "-${currency.format(order.voucher!.discountAmount)}", colorScheme, color: Colors.green),
          const Divider(height: 24),
          _priceRow("Thành tiền", currency.format(order.finalAmount), colorScheme, isBold: true, fontSize: 18, color: colorScheme.primary),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, ColorScheme colorScheme, {Color? color, bool isBold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isBold ? colorScheme.onSurface : colorScheme.outline, fontSize: fontSize)),
          Text(value, style: TextStyle(color: color ?? colorScheme.onSurface, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: fontSize)),
        ],
      ),
    );
  }
}