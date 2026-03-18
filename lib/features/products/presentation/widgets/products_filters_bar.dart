import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/products/presentation/providers/product_categories_provider.dart';
import 'package:riverpod3_starter/features/products/presentation/providers/products_query_controller.dart';
import 'package:riverpod3_starter/features/products/presentation/providers/selected_category_provider.dart';
import 'package:riverpod3_starter/shared/widgets/async/async_value_view.dart';

class ProductsFiltersBar extends ConsumerWidget {
  const ProductsFiltersBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedCategoryProvider);
    final categories = ref.watch(productCategoriesProvider);

    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: '상품 검색',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: ref
              .read(productsQueryControllerProvider.notifier)
              .updateSearchTerm,
        ),
        const SizedBox(height: 12),
        AsyncValueView(
          value: categories,
          data: (resolved) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final category in ['all', ...resolved])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected == category,
                      onSelected: (_) {
                        ref
                            .read(productsQueryControllerProvider.notifier)
                            .selectCategory(category);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
