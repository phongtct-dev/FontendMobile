import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/presentation/widgets/product_card.dart';
import '../../domain/models/product_filter.dart';
import '../providers/shop_provider.dart';
import '../widgets/filter_panel.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});
  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  ProductFilter currentFilter = ProductFilter(minPrice: 0,
      maxPrice: 2000000, // Giá trị hiển thị trên UI slider thôi
      rating: null,      // Mặc định không lọc rating
      isOnSale: false,   // Mặc định không lọc sale
      inStock: false,    // Mặc định không lọc tồn kho);
  );

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(shopProductNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Tìm kiếm sản phẩm...",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            filled: true,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (val) {
            currentFilter.keyword = val;
            ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.filter_list),
                    label: const Text("Bộ lọc"),
                    onPressed: () => _showFilterBottomSheet(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.sort),
                    label: const Text("Sắp xếp"),
                    onPressed: () => _showSortBottomSheet(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: productsAsync.when(
              data: (products) {
                if (products.isEmpty) return _buildEmptyWidget();

                return CustomScrollView(
                  slivers: [
                    // 1. Grid sản phẩm
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => ProductCard(product: products[index]),
                          childCount: products.length,
                        ),
                      ),
                    ),

                    // 2. NÚT XEM THÊM Ở CUỐI
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Gọi hàm loadMore từ Provider
                              ref.read(shopProductNotifierProvider.notifier).loadMore();
                            },
                            child: const Text("Xem thêm sản phẩm",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
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


  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            "Không tìm thấy sản phẩm!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text("Vui lòng thử lại với bộ lọc khác"),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentFilter = ProductFilter(
                  minPrice: 0,
                  maxPrice: 5000000,
                  rating: null,
                  isOnSale: false,
                  inStock: false,
                  page: 1,
                );
              });
              ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
            },
            child: const Text("Xóa bộ lọc"),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => FilterPanel(
        initialFilter: currentFilter,
        onApply: (newFilter) {
          setState(() => currentFilter = newFilter);
          ref.read(shopProductNotifierProvider.notifier).applyFilter(newFilter);
        },
      ),
    );
  }

  // --- ĐÃ ĐƯA CÁC HÀM NÀY VÀO TRONG CLASS ĐỂ HẾT LỖI ---
  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Sắp xếp theo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _sortOption(Icons.new_releases, "Mới nhất", "-createdAt"),
            _sortOption(Icons.trending_up, "Bán chạy nhất", "-sold"),
            _sortOption(Icons.arrow_downward, "Giá: Thấp đến Cao", "price"),
            _sortOption(Icons.arrow_upward, "Giá: Cao đến Thấp", "-price"),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Widget _sortOption(IconData icon, String title, String sortValue) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: currentFilter.sort == sortValue
          ? const Icon(Icons.check, color: Colors.blue)
          : null,
      onTap: () {
        setState(() {
          currentFilter.sort = sortValue;
        });
        ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
        Navigator.pop(context);
      },
    );
  }
}