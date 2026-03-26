import 'package:flutter/material.dart';

class CategoryCircleList extends StatelessWidget {
  final List<dynamic> categories;
  const CategoryCircleList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  backgroundImage: NetworkImage(cat.image),
                ),
                const SizedBox(height: 8),
                Text(
                    cat.name,
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}