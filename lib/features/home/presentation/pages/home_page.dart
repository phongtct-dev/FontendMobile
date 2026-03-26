import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../shop/domain/models/product_filter.dart';
import '../../../shop/presentation/providers/shop_provider.dart';
import '../providers/home_provider.dart';
import '../widgets/banner_slider.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_shimmer_loading.dart';
import '../widgets/product_card.dart';
import '../../../product/domain/entities/product.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // HÀM HELPER: Điều hướng sang trang Shop kèm bộ lọc
  void _goToShopWithFilter(BuildContext context, WidgetRef ref, ProductFilter filter) {
    ref.read(shopProductNotifierProvider.notifier).applyFilter(filter);
    context.go(AppRoutes.shop);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: homeState.when(
        loading: () => const HomeShimmerLoading(),
        error: (err, _) => Center(child: ElevatedButton(onPressed: () => ref.invalidate(homeNotifierProvider), child: const Text("Thử lại"))),
        data: (data) {
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(pinned: true, delegate: SliverSearchDelegate(context)),

              SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.only(top: 10), child: BannerSlider(banners: data.banners))),

              // --- TIÊU ĐỀ DANH MỤC VÀ NÚT XEM TẤT CẢ ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Danh mục sản phẩm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      TextButton(
                        onPressed: () {
                          // Bật còi báo hiệu mở bảng Lọc
                          ref.read(filterSheetTriggerProvider.notifier).state = true;
                          // Nhảy sang trang Shop
                          context.go(AppRoutes.shop);
                        },
                        child: const Text("Xem tất cả >", style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),

              // --- DANH SÁCH DANH MỤC HÌNH TRÒN GIỮ NGUYÊN NHƯ CŨ ---
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final cat = data.categories[index];
                      return GestureDetector(
                        onTap: () => _goToShopWithFilter(context, ref, ProductFilter(categoryId: cat.id)), // Click danh mục -> Lọc
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                  backgroundImage: NetworkImage(cat.image)
                              ),
                              const SizedBox(height: 8),
                              Text(cat.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // --- 1. GIÁ SỐC MỖI NGÀY ---
              if (data.flashSales.isNotEmpty) ...[
                _buildHeader("⚡ Giá sốc mỗi ngày"),
                _buildProductGrid(data.flashSales),
                _buildSeeMoreBtn(context, "Xem tất cả Giá Sốc", () => _goToShopWithFilter(context, ref, ProductFilter(isOnSale: true))),
              ],

              // --- 2. BÁN CHẠY NHẤT ---
              if (data.bestSellers.isNotEmpty) ...[
                _buildHeader("🔥 Bán chạy nhất"),
                _buildProductGrid(data.bestSellers),
                _buildSeeMoreBtn(context, "Xem tất cả Bán Chạy", () => _goToShopWithFilter(context, ref, ProductFilter(sort: '-sold'))),
              ],

              // --- 3. MỚI NHẤT ---
              if (data.newArrivals.isNotEmpty) ...[
                _buildHeader("✨ Sản phẩm mới nhất"),
                _buildProductGrid(data.newArrivals),
                _buildSeeMoreBtn(context, "Xem tất cả Sản Phẩm Mới", () => _goToShopWithFilter(context, ref, ProductFilter(sort: '-createdAt'))),
              ],

              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
          );
        },
      ),
    );
  }

  // Helper tạo Header
  Widget _buildHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
      ),
    );
  }

  // Helper tạo Lưới Sản Phẩm
  Widget _buildProductGrid(List<ProductEntity> products) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.72),
        delegate: SliverChildBuilderDelegate((context, index) => ProductCard(product: products[index]), childCount: products.length),
      ),
    );
  }

  // Helper tạo Nút Xem Thêm
  Widget _buildSeeMoreBtn(BuildContext context, String text, VoidCallback onPressed) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}