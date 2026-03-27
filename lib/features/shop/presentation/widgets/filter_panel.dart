import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product_filter.dart';
import '../../../home/presentation/providers/home_provider.dart';

class FilterPanel extends ConsumerStatefulWidget {
  final ProductFilter initialFilter;
  final Function(ProductFilter) onApply;

  const FilterPanel({super.key, required this.initialFilter, required this.onApply});

  @override
  ConsumerState<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends ConsumerState<FilterPanel> {
  late ProductFilter tempFilter;
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    tempFilter = widget.initialFilter;

    // Đảm bảo giá trị slider an toàn
    double min = tempFilter.minPrice ?? 0;
    double max = tempFilter.maxPrice ?? 2000000;
    if (min > max) min = 0;
    _currentRangeValues = RangeValues(min, max);
  }

  @override
  Widget build(BuildContext context) {
    // Lấy theme để tự động đổi màu theo Light/Dark mode
    final theme = Theme.of(context);

    // Lấy danh sách Categories từ HomeProvider
    final homeState = ref.watch(homeNotifierProvider);
    final categories = homeState.valueOrNull?.categories ?? [];

    return Container(
      // THÊM MÀU NỀN VÀ BO GÓC TẠI ĐÂY
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // Trắng ở Light mode, Xám đen ở Dark mode
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          // 1. THANH KÉO (DRAG HANDLE)
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 2. HEADER: TIÊU ĐỀ & NÚT ĐÓNG (CLOSE)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                  "Lọc Sản Phẩm",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 28),
                onPressed: () => Navigator.pop(context), // Đóng bảng lọc
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(), // Bỏ khoảng trống thừa của nút
              ),
            ],
          ),
          const Divider(height: 24),

          // 3. NỘI DUNG CUỘN ĐƯỢC
          Expanded(
            child: ListView(
              children: [
                // --- LỌC THEO DANH MỤC ---
                const Text("Danh mục", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                if (categories.isEmpty) const Text("Đang tải danh mục..."),
                Wrap(
                  spacing: 10,
                  children: categories.map((cat) => ChoiceChip(
                    label: Text(cat.name),
                    selected: tempFilter.categoryId == cat.id,
                    onSelected: (val) {
                      setState(() => tempFilter.categoryId = val ? cat.id : null);
                    },
                  )).toList(),
                ),
                const Divider(height: 30),

                // --- LỌC THEO GIÁ ---
                const Text("Khoảng giá", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                RangeSlider(
                  values: _currentRangeValues,
                  max: 2000000,
                  divisions: 20,
                  labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString()
                  ),
                  onChanged: (values) {
                    setState(() {
                      _currentRangeValues = values;
                      tempFilter.minPrice = values.start;
                      tempFilter.maxPrice = values.end;
                    });
                  },
                ),
                const Divider(height: 30),

                // --- LỌC THEO ĐÁNH GIÁ ---
                const Text("Đánh giá", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [5, 4, 3].map((star) => ChoiceChip(
                    label: Text("$star ⭐ trở lên"),
                    selected: tempFilter.rating == star.toDouble(),
                    onSelected: (val) => setState(() => tempFilter.rating = val ? star.toDouble() : null),
                  )).toList(),
                ),
                const Divider(height: 30),

                // --- CHECKBOX KHÁC ---
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Sản phẩm đang giảm giá"),
                  value: tempFilter.isOnSale ?? false,
                  onChanged: (val) => setState(() => tempFilter.isOnSale = val),
                  activeColor: theme.colorScheme.primary,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Sản phẩm còn hàng"),
                  value: tempFilter.inStock ?? false,
                  onChanged: (val) => setState(() => tempFilter.inStock = val),
                  activeColor: theme.colorScheme.primary,
                ),
              ],
            ),
          ),

          // --- 4. FOOTER BUTTONS ---
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      tempFilter = ProductFilter(minPrice: 0, maxPrice: 2000000);
                      _currentRangeValues = const RangeValues(0, 2000000);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: const Text("Xoá bộ lọc", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    widget.onApply(tempFilter);
                    Navigator.pop(context); // Đóng bảng lọc sau khi Áp dụng
                  },
                  child: const Text("Áp dụng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}