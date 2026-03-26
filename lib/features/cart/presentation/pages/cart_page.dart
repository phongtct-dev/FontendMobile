import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/navigation/app_router.dart';
import '../../domain/models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../../../profile/presentation/providers/profile_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // Sử dụng màu background từ AppTheme (0xFFEAEFF5 hoặc 0xFF13161B)
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("Giỏ hàng", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        // Tự động thích ứng màu dựa trên Theme
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: cartAsync.when(
        data: (cart) {
          if (cart == null || cart.items.isEmpty) {
            return _buildEmptyCart(context, colorScheme);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return _CartItemWidget(item: item);
                  },
                ),
              ),
              _buildCartSummary(context, cart, colorScheme,ref),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Lỗi: $err")),
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.shopping_basket_outlined,
                size: 80, color: colorScheme.outline),
          ),
          const SizedBox(height: 24),
          Text("Giỏ hàng của bạn đang trống",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onBackground.withOpacity(0.7))),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text("Tiếp tục mua sắm"),
          )
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, CartResponse cart, ColorScheme colorScheme, WidgetRef ref) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(colorScheme.brightness == Brightness.light ? 0.08 : 0.3),
              blurRadius: 15,
              offset: const Offset(0, -5)
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tạm tính (${cart.cartStats.itemCount} sản phẩm)",
                    style: TextStyle(color: colorScheme.outline, fontSize: 14)),
                Text(currencyFormat.format(cart.cartStats.totalFinalPrice),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary)), // Màu 0xFF1877D2
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              onPressed: () async {
                try {
                  // Hiển thị một SnackBar nhỏ để báo đang xử lý (tùy chọn, giúp UX tốt hơn)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đang kiểm tra thông tin..."), duration: Duration(milliseconds: 500)),
                  );

                  // CHỜ DỮ LIỆU BẰNG .future
                  final user = await ref.read(profileNotifierProvider.future);

                  // Kiểm tra mounted trước khi dùng context sau hàm async
                  if (!context.mounted) return;

                  if (user == null || user.address == null || user.phone == null || user.address!.isEmpty || user.phone!.isEmpty) {
                    // Thiếu thông tin
                    context.push(AppRoutes.updateProfile);
                  } else {
                    // Đủ thông tin
                    context.push(AppRoutes.checkout);
                  }
                } catch (e) {
                  // Xử lý lỗi nếu việc fetch profile thất bại
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lỗi tải thông tin: $e")),
                    );
                  }
                }
              },
              child: const Text("THANH TOÁN NGAY",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItemWidget extends ConsumerWidget {
  final CartItemEntity item;
  const _CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = item.product;
    final colorScheme = Theme.of(context).colorScheme;
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return Dismissible(
      key: Key(product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete_sweep, color: colorScheme.onErrorContainer, size: 30),
      ),
      onDismissed: (_) {
        ref.read(cartNotifierProvider.notifier).deleteItem(product.id);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surface, // Dùng 0xFFFFFFFF (Light) hoặc 0xFF1F2327 (Dark)
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4)
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                  product.images.isNotEmpty ? product.images[0].url : 'https://via.placeholder.com/150',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name ?? "Sản phẩm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Text(currencyFormat.format(product.isOnSale ? product.salePrice : product.price),
                      style: TextStyle(
                          color: colorScheme.primary, // Dùng màu Primary thay vì đỏ cố định để đúng Brand
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.background, // Tiệp màu với nền app
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            _qtyBtn(Icons.remove, () {
                              if (item.quantity > 1) {
                                ref.read(cartNotifierProvider.notifier).updateQty(product.id, item.quantity - 1);
                              }
                            }, colorScheme),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text("${item.quantity}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: colorScheme.onSurface)),
                            ),
                            _qtyBtn(Icons.add, () {
                              ref.read(cartNotifierProvider.notifier).updateQty(product.id, item.quantity + 1);
                            }, colorScheme),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: colorScheme.error.withOpacity(0.7), size: 22),
                        onPressed: () => ref.read(cartNotifierProvider.notifier).deleteItem(product.id),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap, ColorScheme colorScheme) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: colorScheme.primary),
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      padding: EdgeInsets.zero,
      splashRadius: 20,
    );
  }
}