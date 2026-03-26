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
  // Bộ lọc mặc định
  ProductFilter currentFilter = ProductFilter(
    minPrice: 0,
    maxPrice: 2000000,
    rating: null,
    isOnSale: false,
    inStock: false,
  );

  // THÊM: Controller để quản lý thanh tìm kiếm và nút (X)
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(shopProductNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0, // Bỏ bóng mờ cho thiết kế phẳng
        titleSpacing: 16, // Canh lề chuẩn
        title: Container(
          height: 44, // Độ cao tiêu chuẩn của Search bar Apple/Google
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.grey[200],
            borderRadius: BorderRadius.circular(12), // Bo góc hiện đại
          ),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search, // Đổi phím Enter thành Kính Lúp trên bàn phím
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: "Tìm kiếm sản phẩm...",
              hintStyle: TextStyle(color: theme.colorScheme.outline, fontSize: 15),
              prefixIcon: Icon(Icons.search, color: theme.colorScheme.outline, size: 22),
              // NÚT XÓA CHỮ (Chỉ hiện khi có chữ)
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(Icons.cancel, color: theme.colorScheme.outline, size: 20),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    currentFilter.keyword = null;
                  });
                  ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
                  FocusScope.of(context).unfocus(); // Đóng bàn phím
                },
              )
                  : null,
              border: InputBorder.none, // Bỏ viền mặc định
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: (val) {
              setState(() {}); // Gọi setState rỗng để nút (X) hiện lên/ẩn đi lập tức
              currentFilter.keyword = val;
              ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          // THANH CÔNG CỤ: BỘ LỌC & SẮP XẾP
          Container(
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurface,
                      side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.3)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.filter_list, size: 18),
                    label: const Text("Bộ lọc", style: TextStyle(fontWeight: FontWeight.w500)),
                    onPressed: () => _showFilterBottomSheet(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurface,
                      side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.3)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.sort, size: 18),
                    label: const Text("Sắp xếp", style: TextStyle(fontWeight: FontWeight.w500)),
                    onPressed: () => _showSortBottomSheet(context),
                  ),
                ),
              ],
            ),
          ),

          // DANH SÁCH SẢN PHẨM
          Expanded(
            child: productsAsync.when(
              data: (products) {
                if (products.isEmpty) return _buildEmptyWidget();

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => ProductCard(product: products[index]),
                          childCount: products.length,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              side: BorderSide(color: theme.colorScheme.primary),
                            ),
                            onPressed: () => ref.read(shopProductNotifierProvider.notifier).loadMore(),
                            child: const Text("Xem thêm sản phẩm", style: TextStyle(fontWeight: FontWeight.bold)),
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

  // GIAO DIỆN KHI KHÔNG TÌM THẤY SẢN PHẨM
  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text("Không tìm thấy sản phẩm!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          const Text("Vui lòng thử lại với từ khóa hoặc bộ lọc khác"),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text("Xóa bộ lọc & Tìm kiếm"),
            onPressed: () {
              _searchController.clear();
              setState(() {
                currentFilter = ProductFilter(minPrice: 0, maxPrice: 2000000, page: 1);
              });
              ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
            },
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Để lộ nền cong phía trên
      builder: (context) => FilterPanel(
        initialFilter: currentFilter,
        onApply: (newFilter) {
          setState(() => currentFilter = newFilter);
          ref.read(shopProductNotifierProvider.notifier).applyFilter(newFilter);
        },
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Thanh nắm kéo (Drag handle)
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40, height: 4,
                decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Sắp xếp theo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _sortOption(Icons.new_releases, "Mới nhất", "-createdAt"),
              _sortOption(Icons.trending_up, "Bán chạy nhất", "-sold"),
              _sortOption(Icons.arrow_downward, "Giá: Thấp đến Cao", "price"),
              _sortOption(Icons.arrow_upward, "Giá: Cao đến Thấp", "-price"),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _sortOption(IconData icon, String title, String sortValue) {
    final isSelected = currentFilter.sort == sortValue;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Theme.of(context).primaryColor : null),
      title: Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? Theme.of(context).primaryColor : null)),
      trailing: isSelected ? Icon(Icons.check_circle, color: Theme.of(context).primaryColor) : null,
      onTap: () {
        setState(() => currentFilter.sort = sortValue);
        ref.read(shopProductNotifierProvider.notifier).applyFilter(currentFilter);
        Navigator.pop(context);
      },
    );
  }
}