import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../domain/models/review.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  int selectedImageIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productDetailProvider(widget.productId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: productAsync.when(
        data: (product) => Stack(
          children: [
            CustomScrollView(
              slivers: [
                // 1. Ảnh sản phẩm co giãn (SliverAppBar)
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        const SizedBox(height: 100),
                        // Ảnh to
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(product.images[selectedImageIndex].url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Thumbnails
                        Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.images.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => setState(() => selectedImageIndex = index),
                              child: Container(
                                width: 60,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImageIndex == index ? colorScheme.primary : Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(product.images[index].url),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Thông tin chi tiết
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.brand ?? "No Brand", style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 20),
                                Text(" ${product.ratingsAverage} (${product.ratingsQuantity} đánh giá)"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),

                        // Giá tiền
                        Row(
                          children: [
                            Text(
                              NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(product.isOnSale ? product.salePrice : product.price),
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colorScheme.error),
                            ),
                            const SizedBox(width: 10),
                            if (product.isOnSale)
                              Text(
                                NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(product.price),
                                style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                              ),
                          ],
                        ),

                        const Divider(height: 40),
                        const Text("Mô tả sản phẩm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(product.description ?? "Đang cập nhật...", style: const TextStyle(height: 1.5, color: Colors.grey)),
                        const SizedBox(height: 100), // Khoảng trống cho Bottom Bar
                      ],
                    ),
                  ),
                ),



                // 3. TIÊU ĐỀ ĐÁNH GIÁ
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Đánh giá sản phẩm",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),



                // 4. DANH SÁCH REVIEW (Infinite List)
                _buildReviewList(context),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Divider(),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            side: BorderSide(color: colorScheme.primary),
                          ),
                          onPressed: () => context.go(AppRoutes.shop), // Chuyển về trang Shop
                          child: const Text("Xem thêm các sản phẩm khác"),
                        ),
                        const SizedBox(height: 100), // Cách đáy để không bị đè bởi Bottom Bar
                      ],
                    ),
                  ),
                ),





              ],
            ),

            // 3. Bottom Bar: Số lượng & Nút mua
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                ),
                child: Row(
                  children: [
                    // Chọn số lượng
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: () => setState(() => quantity > 1 ? quantity-- : null), icon: const Icon(Icons.remove)),
                          Text("$quantity", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(onPressed: () => setState(() => quantity++), icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Nút Thêm vào giỏ
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          // SỬA TẠI ĐÂY:
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: ()async {
                          // Gọi provider để thêm hàng
                          await ref.read(cartNotifierProvider.notifier).addItem(product.id, quantity);

                          // Hiển thị thông báo
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Đã thêm $quantity ${product.name} vào giỏ"),
                                backgroundColor: Colors.green,
                                action: SnackBarAction(
                                  label: "GIỎ HÀNG",
                                  textColor: Colors.white,
                                  onPressed: () => context.push(AppRoutes.cart),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("Thêm vào giỏ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Lỗi: $err")),
      ),
    );
  }

  Widget _buildReviewList(BuildContext context) {
    final reviewsAsync = ref.watch(productReviewsNotifierProvider(widget.productId));

    return reviewsAsync.when(
      data: (reviews) {
        if (reviews.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("Chưa có đánh giá nào cho sản phẩm này."),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index < reviews.length) {
                final review = reviews[index];
                return _ReviewItem(review: review);
              } else {
                // Nút Load More Review
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextButton(
                    onPressed: () => ref
                        .read(productReviewsNotifierProvider(widget.productId).notifier)
                        .loadMore(),
                    child: const Text("Xem thêm đánh giá"),
                  ),
                );
              }
            },
            childCount: reviews.length + 1, // +1 cho nút load more
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
      error: (e, _) => SliverToBoxAdapter(child: Text("Lỗi tải đánh giá: $e")),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final ReviewEntity review;
  const _ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: review.user.avatar != null
                    ? NetworkImage(review.user.avatar!)
                    : null,
                child: review.user.avatar == null ? const Icon(Icons.person, size: 15) : null,
              ),
              const SizedBox(width: 10),
              Text(review.user.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Row(
                children: List.generate(5, (index) => Icon(
                    Icons.star,
                    size: 14,
                    color: index < review.rating ? Colors.amber : Colors.grey[300]
                )),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(review.review, style: const TextStyle(color: Colors.grey)),
          const Divider(),
        ],
      ),
    );
  }
}