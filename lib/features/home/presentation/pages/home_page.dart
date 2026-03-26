import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_provider.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_circle_list.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_shimmer_loading.dart';

import '../widgets/product_card.dart'; // Chúng ta sẽ viết file này tiếp theo

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lắng nghe dữ liệu từ HomeNotifier
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: homeState.when(
        // TRẠNG THÁI ĐANG LOAD: Hiện Shimmer bóng mờ chuyên nghiệp
        loading: () => const HomeShimmerLoading(),

        // TRẠNG THÁI LỖI: Hiện nút thử lại
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lỗi: $err"),
              ElevatedButton(
                onPressed: () => ref.invalidate(homeNotifierProvider),
                child: const Text("Thử lại"),
              )
            ],
          ),
        ),

        // TRẠNG THÁI CÓ DỮ LIỆU: Hiển thị giao diện chính
        data: (data) {
          return CustomScrollView(
            slivers: [
              // 1. Sticky Search Bar (Thanh tìm kiếm cố định)
              SliverPersistentHeader(
                pinned: true, // Thanh search sẽ "dính" trên đầu khi cuộn
                delegate: SliverSearchDelegate(context), // CHỈ TRUYỀN NHƯ THẾ NÀY
              ),

              // 2. Banner Slider
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: BannerSlider(banners: data.banners),
                ),
              ),

              // 3. Tiêu đề: Danh mục
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Danh mục sản phẩm",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),

              // 4. Danh sách Category hình tròn
              SliverToBoxAdapter(
                child: CategoryCircleList(categories: data.categories),
              ),

              // 5. Tiêu đề: Sản phẩm mới nhất
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sản phẩm mới nhất",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),

              // 6. Grid Sản phẩm (Hiện 10 món)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75, // Chỉnh tỉ lệ card cho đẹp
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final product = data.newArrivals[index];
                      return ProductCard(product: product);
                    },
                    childCount: data.newArrivals.length,
                  ),
                ),
              ),

              // 7. Nút Xem thêm
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OutlinedButton(
                    onPressed: () {
                      // Điều hướng sang trang xem tất cả sản phẩm
                    },
                    child: const Text("Xem thêm sản phẩm"),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
          );
        },
      ),
    );
  }
}