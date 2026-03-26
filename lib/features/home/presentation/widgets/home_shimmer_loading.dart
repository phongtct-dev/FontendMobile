import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Column(
        children: [
          Container(height: 180, width: double.infinity, color: Colors.white),
          const SizedBox(height: 20),
          Row(
            children: List.generate(4, (index) => Container(
              margin: const EdgeInsets.all(10),
              width: 60, height: 60, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            )),
          )
        ],
      ),
    );
  }
}