import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/navigation/app_router.dart';
import '../../../product/domain/entities/product.dart'; // Thư viện để format giá tiền


class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  // Hàm helper để format tiền tệ: 100000 -> 100.000 VNĐ
  String formatPrice(double price) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(price)} VNĐ';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Logic xác định Badge: Nếu mới tạo trong 7 ngày là NEW, nếu bán > 50 là HOT
    final createdAt = product.createdAt;
    final isNew = createdAt != null &&
        DateTime.now().difference(createdAt).inDays < 7;

    final isHot = product.sold > 50;

    return
      GestureDetector(
        onTap: () {
          // Điều hướng sang trang chi tiết
          context.push('${AppRoutes.productDetail}/${product.id}');
        },
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias, // Giúp ảnh bo góc mượt hơn
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.dividerColor.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. PHẦN ẢNH VÀ BADGE (Sử dụng Stack)
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // Ảnh sản phẩm
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.images.isNotEmpty
                              ? product.images[0].url
                              : 'https://via.placeholder.com/150'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Badge Giảm giá (Góc trên trái)
                    if (product.isOnSale)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "-${product.discountPercent}%",
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    // Badge HOT/NEW (Góc trên phải)
                    if (isHot || isNew)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isHot ? Colors.orange : Colors.blue,
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

              // 2. PHẦN THÔNG TIN SẢN PHẨM
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tên sản phẩm
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          height: 1.2,
                        ),
                      ),

                      // Đánh giá sao (Rating)
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < product.ratingsAverage.floor()
                                    ? Icons.star
                                    : (index < product.ratingsAverage ? Icons.star_half : Icons.star_border),
                                color: Colors.amber,
                                size: 14,
                              );
                            }),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            product.ratingsAverage.toString(),
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),

                      // Giá tiền
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.isOnSale) ...[
                            // Giá đã giảm
                            Text(
                              formatPrice(product.salePrice),
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            // Giá gốc gạch ngang
                            Text(
                              formatPrice(product.price),
                              style: theme.textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ] else
                          // Giá bình thường
                            Text(
                              formatPrice(product.price),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF1877D2),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );



  }
}