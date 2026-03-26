import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/navigation/app_router.dart';
import '../../domain/models/order_model.dart';
import '../providers/orders_provider.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  // Biến quản lý trạng thái xoay vòng của nút "Xem thêm"
  bool _isLoadingMore = false;

  final List<Map<String, String>> filters = [
    {'value': 'ALL', 'label': 'Tất cả'},
    {'value': 'PENDING', 'label': 'Chờ xác nhận'},
    {'value': 'CONFIRMED', 'label': 'Đã xác nhận'},
    {'value': 'SHIPPING', 'label': 'Đang giao'},
    {'value': 'SUCCESS', 'label': 'Thành công'},
    {'value': 'CANCELLED', 'label': 'Đã hủy'},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ordersAsync = ref.watch(ordersNotifierProvider);
    final notifier = ref.read(ordersNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("Lịch sử đơn hàng", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          // THANH LỌC TRẠNG THÁI (Giữ nguyên)
          Container(
            height: 50,
            color: colorScheme.surface,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                final isSelected = notifier.currentStatus == filter['value'];

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filter['label']!),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) notifier.changeStatus(filter['value']!);
                    },
                    selectedColor: colorScheme.primary.withOpacity(0.1),
                    labelStyle: TextStyle(
                      color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: isSelected ? colorScheme.primary : colorScheme.outline.withOpacity(0.2)),
                    ),
                    backgroundColor: colorScheme.surface,
                  ),
                );
              },
            ),
          ),

          // DANH SÁCH & NÚT XEM THÊM
          Expanded(
            child: ordersAsync.when(
              data: (orders) {
                if (orders.isEmpty) return _buildEmptyState(colorScheme);

                return RefreshIndicator(
                  onRefresh: () async => ref.refresh(ordersNotifierProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: orders.length + (notifier.hasMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {

                      // Nếu render đến phần tử cuối cùng và còn dữ liệu -> Hiện nút Xem Thêm
                      if (index == orders.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: _isLoadingMore
                                ? const CircularProgressIndicator() // Đang tải thì xoay
                                : OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: colorScheme.primary,
                                side: BorderSide(color: colorScheme.primary),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () async {
                                // 1. Bật hiệu ứng loading
                                setState(() => _isLoadingMore = true);

                                // 2. Chờ load thêm dữ liệu
                                await notifier.loadMore();

                                // 3. Tắt hiệu ứng loading
                                if (mounted) setState(() => _isLoadingMore = false);
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              label: const Text("Xem thêm đơn hàng", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        );
                      }

                      return _buildOrderCard(context, orders[index], colorScheme);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text("Lỗi: $err")),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 80, color: colorScheme.outline.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text("Không tìm thấy đơn hàng nào", style: TextStyle(color: colorScheme.onBackground.withOpacity(0.7), fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderEntity order, ColorScheme colorScheme) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    final date = order.createdAt != null ? DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt!) : "Không rõ";

    Color statusColor;
    String statusText;
    switch (order.status) {
      case 'PENDING': statusColor = Colors.orange; statusText = "Chờ xác nhận"; break;
      case 'CONFIRMED': statusColor = Colors.blue; statusText = "Đã xác nhận"; break;
      case 'SHIPPING': statusColor = Colors.amber; statusText = "Đang giao"; break;
      case 'SUCCESS': case 'DELIVERED': statusColor = Colors.green; statusText = "Thành công"; break;
      case 'CANCELLED': statusColor = Colors.red; statusText = "Đã hủy"; break;
      default: statusColor = Colors.grey; statusText = order.status;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        context.push('${AppRoutes.orderDetail}/${order.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(colorScheme.brightness == Brightness.light ? 0.05 : 0.2), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Đơn #${order.id.substring(order.id.length - 6).toUpperCase()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: colorScheme.outline),
                const SizedBox(width: 8),
                Text(date, style: TextStyle(color: colorScheme.outline, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.inventory_2_outlined, size: 16, color: colorScheme.outline),
                const SizedBox(width: 8),
                Text("${order.items.length} sản phẩm", style: TextStyle(color: colorScheme.outline, fontSize: 13)),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng thanh toán:", style: TextStyle(fontWeight: FontWeight.w500)),
                Text(currency.format(order.finalAmount), style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}