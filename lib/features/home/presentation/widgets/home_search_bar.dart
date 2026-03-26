

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_router.dart';
import '../../../cart/presentation/providers/cart_provider.dart';

class HomeSearchBar extends ConsumerWidget { // ĐỔI SANG ConsumerWidget
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // THÊM WidgetRef
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // LẤY SỐ LƯỢNG GIỎ HÀNG THỰC TẾ
    final cartAsync = ref.watch(cartNotifierProvider);
    final itemCount = cartAsync.maybeWhen(
      data: (cart) => cart?.cartStats.itemCount ?? 0,
      orElse: () => 0,
    );

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.go(AppRoutes.home),
            child: Text(
              "ECOSHOP",
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 18,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                readOnly: true,
                onTap: () => context.push('/search'),
                decoration: InputDecoration(
                  hintText: "Tìm kiếm...",
                  prefixIcon: Icon(Icons.search, size: 20, color: theme.iconTheme.color),
                  fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => context.push(AppRoutes.cart),
            icon: Badge(
              // ĐIỀU CHỈNH TẠI ĐÂY: Hiển thị itemCount thực tế
              label: Text(itemCount.toString()),
              isLabelVisible: itemCount > 0, // Chỉ hiện badge khi có hàng
              child: Icon(
                  Icons.shopping_cart_outlined,
                  color: theme.colorScheme.onSurface
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverSearchDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context; // Thêm biến context để lấy padding top
  SliverSearchDelegate(this.context);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.bottomCenter,
      child: const HomeSearchBar(),
    );
  }

  @override
  double get maxExtent => 60 + MediaQuery.of(context).padding.top;
  @override
  double get minExtent => 60 + MediaQuery.of(context).padding.top;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}