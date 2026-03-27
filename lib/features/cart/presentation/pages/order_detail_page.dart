import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/models/order_model.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../../shop/presentation/widgets/review_bottom_sheet.dart';

// ĐÃ CHUYỂN SANG StatefulWidget ĐỂ LƯU TRẠNG THÁI NÚT BẤM
class OrderDetailPage extends ConsumerStatefulWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  // BIẾN QUAN TRỌNG: Lưu danh sách ID các sản phẩm vừa được đánh giá xong
  final Set<String> _reviewedProductIds = {};

  @override
  Widget build(BuildContext context) {
    final orderAsync = ref.watch(orderDetailFutureProvider(widget.orderId));
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
                _buildOrderItems(context, order), // HÀM CHỨA NÚT ĐÁNH GIÁ
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
    final allStatuses = ['PENDING', 'CONFIRMED', 'SHIPPING', 'DELIVERED'];
    if (order.status == 'CANCELLED') allStatuses[1] = 'CANCELLED';

    int currentIndex = allStatuses.indexOf(order.status);
    if (order.status == 'SUCCESS') currentIndex = 3;

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

          ...List.generate(allStatuses.length, (index) {
            final isCompleted = index <= currentIndex;
            final isLast = index == allStatuses.length - 1;
            final statusCode = allStatuses[index];

            final historyItem = order.statusHistory.where((h) => h.status == statusCode).lastOrNull;
            final timeStr = historyItem?.updatedAt != null ? DateFormat('dd/MM HH:mm').format(historyItem!.updatedAt!) : '';

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
                    if (!isLast) Container(width: 2, height: 40, color: isCompleted ? colorScheme.primary : colorScheme.surfaceVariant),
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
                        if (timeStr.isNotEmpty) Text(timeStr, style: TextStyle(fontSize: 12, color: colorScheme.outline)),
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

  // 3. SẢN PHẨM TRONG ĐƠN (CÓ LOGIC KHÓA NÚT ĐÁNH GIÁ)
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
            final productData = item.product is Map<String, dynamic> ? item.product as Map<String, dynamic> : null;
            final productId = productData?['_id'] ?? productData?['id'] ?? '';
            final imageUrl = (productData?['images'] != null && productData!['images'].isNotEmpty) ? productData['images'][0]['url'] : 'https://via.placeholder.com/150';
            final itemName = item.name ?? productData?['name'] ?? "Sản phẩm";

            // KIỂM TRA XEM SẢN PHẨM NÀY ĐÃ ĐƯỢC ĐÁNH GIÁ TRONG PHIÊN NÀY CHƯA
            final isReviewed = _reviewedProductIds.contains(productId);

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
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

                  if (order.status == 'SUCCESS' && productId.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          // ĐỔI MÀU SANG XÁM NẾU ĐÃ ĐÁNH GIÁ
                          foregroundColor: isReviewed ? Colors.grey : Colors.orange,
                          side: BorderSide(color: isReviewed ? Colors.grey.shade300 : Colors.orange),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        // ĐỔI ICON VÀ CHỮ NẾU ĐÃ ĐÁNH GIÁ
                        icon: Icon(isReviewed ? Icons.check_circle : Icons.edit_note, size: 18),
                        label: Text(isReviewed ? "Đã đánh giá" : "Đánh giá", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),

                        // KHÓA NÚT BẰNG CÁCH SET onPressed = null NẾU ĐÃ ĐÁNH GIÁ
                        onPressed: isReviewed ? null : () async {
                          // Lắng nghe kết quả trả về từ BottomSheet
                          final result = await showModalBottomSheet<bool>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              child: ReviewBottomSheet(productId: productId, productName: itemName),
                            ),
                          );

                          // Nếu nhận được còi báo hiệu 'true' -> Cập nhật UI
                          if (result == true) {
                            setState(() {
                              _reviewedProductIds.add(productId);
                            });
                          }
                        },
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