import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/product_filter.dart';

class FilterPanel extends StatefulWidget {
  final ProductFilter initialFilter;
  final Function(ProductFilter) onApply;

  const FilterPanel({super.key, required this.initialFilter, required this.onApply});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  late ProductFilter tempFilter;
  RangeValues _currentRangeValues = const RangeValues(0, 1000000);


  @override
  void initState() {
    super.initState();
    tempFilter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Text("Khoảng giá", style: TextStyle(fontWeight: FontWeight.bold)),
                RangeSlider(
                  values: _currentRangeValues,
                  max: 2000000,
                  divisions: 20,
                  labels: RangeLabels(_currentRangeValues.start.round().toString(), _currentRangeValues.end.round().toString()),
                  onChanged: (values) {
                    setState(() {
                      _currentRangeValues = values;
                      tempFilter.minPrice = values.start;
                      tempFilter.maxPrice = values.end;
                    });
                  },
                ),
                const Divider(),
                const Text("Đánh giá", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10,
                  children: [5, 4, 3].map((star) => ChoiceChip(
                    label: Text("$star ⭐ trở lên"),
                    selected: tempFilter.rating == star.toDouble(),
                    onSelected: (val) => setState(() => tempFilter.rating = val ? star.toDouble() : null),
                  )).toList(),
                ),
                const Divider(),
                CheckboxListTile(
                  title: const Text("Chỉ xem sản phẩm đang giảm giá"),
                  value: tempFilter.isOnSale ?? false,
                  onChanged: (val) => setState(() => tempFilter.isOnSale = val),
                ),
                CheckboxListTile(
                  title: const Text("Chỉ xem sản phẩm còn hàng"),
                  value: tempFilter.inStock ?? false,
                  onChanged: (val) => setState(() => tempFilter.inStock = val),
                ),
              ],
            ),
          ),
          // FOOTER BUTTONS
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      tempFilter = ProductFilter(
                        minPrice: 0,
                        maxPrice: 2000000,
                        rating: null,
                        isOnSale: false,
                        inStock: false,


                      ); // Reset về mặc định
                       // Reset slider
                    });
                    widget.onApply(tempFilter);
                    // Có thể chọn đóng luôn hoặc để người dùng bấm Áp dụng
                  },
                  child: const Text("Xoá bộ lọc", style: TextStyle(color: Colors.red)),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    widget.onApply(tempFilter);
                    Navigator.pop(context);
                  },
                  child: const Text("Áp dụng", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}