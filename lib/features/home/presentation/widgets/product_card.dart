import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/navigation/app_router.dart';
import '../../../product/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  // Hàm helper để format tiền tệ chuẩn: 100,000 ₫
  String formatPrice(double price) {
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(price);
  }

  // Hàm rút gọn số lượng bán (ví dụ: 1200 -> 1.2k)
  String formatSold(int sold) {
    if (sold >= 1000) {
      return '${(sold / 1000).toStringAsFixed(1)}k';
    }
    return sold.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Logic xác định Badge: Mới tạo trong 7 ngày là NEW, bán > 50 là HOT
    final createdAt = product.createdAt;
    final isNew = createdAt != null && DateTime.now().difference(createdAt).inDays < 7;
    final isHot = product.sold > 50;

    return GestureDetector(
      onTap: () {
        // Điều hướng sang trang chi tiết
        context.push('${AppRoutes.productDetail}/${product.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          // Thêm bóng đổ nhẹ (BoxShadow) giúp Card nổi bật và sang trọng hơn
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
        ),
        clipBehavior: Clip.antiAlias, // Bo góc cho cả ảnh bên trong
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. PHẦN ẢNH VÀ BADGE (Tự động co giãn)
            // ==========================================
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Ảnh sản phẩm
                  Image.network(
                    product.images.isNotEmpty ? product.images[0].url : 'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                    // Hiệu ứng loading nhẹ khi tải ảnh
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 2,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),

                  // Badge Giảm giá (Góc trên trái)
                  if (product.isOnSale)
                    Positioned(
                      top: 8, left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF424E), // Màu đỏ chuẩn Tiki/Shopee
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "-${product.discountPercent}%",
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  // Badge HOT/NEW (Góc trên phải)
                  if (isHot || isNew)
                    Positioned(
                      top: 8, right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: isHot ? const Color(0xFFFF9900) : const Color(0xFF00B14F), // Cam cho HOT, Xanh cho NEW
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          isHot ? "HOT" : "NEW",
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // ==========================================
            // 2. PHẦN THÔNG TIN SẢN PHẨM (Chiều cao tự động)
            // ==========================================
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên sản phẩm
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.3, // Khoảng cách dòng chuẩn
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Đánh giá sao & Đã bán
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        product.ratingsAverage.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 4),
                      Container(width: 1, height: 10, color: Colors.grey.shade400), // Vạch ngăn cách
                      const SizedBox(width: 4),
                      Text(
                        "Đã bán ${formatSold(product.sold)}",
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Cụm Giá tiền & Icon Giỏ hàng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Cột giá
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.isOnSale)
                              Text(
                                formatPrice(product.price),
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            Text(
                              formatPrice(product.isOnSale ? product.salePrice : product.price),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: product.isOnSale ? const Color(0xFFFF424E) : theme.colorScheme.primary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      // Icon thêm vào giỏ hàng mini
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                        child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 16),
                      ),
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
}