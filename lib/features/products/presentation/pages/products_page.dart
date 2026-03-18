import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/products/presentation/providers/products_list_controller.dart';
import 'package:riverpod3_starter/features/products/presentation/widgets/products_filters_bar.dart';
import 'package:riverpod3_starter/features/products/presentation/widgets/products_list_view.dart';
import 'package:riverpod3_starter/shared/widgets/async/async_value_view.dart';
import 'package:riverpod3_starter/shared/widgets/layout/app_scaffold.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsListControllerProvider);

    return AppScaffold(
      title: '상품',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ProductsFiltersBar(),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(productsListControllerProvider.notifier).refresh(),
              child: AsyncValueView(
                value: productsState,
                onRetry: () =>
                    ref.read(productsListControllerProvider.notifier).refresh(),
                data: (state) => ProductsListView(
                  state: state,
                  onLoadMore: () => ref
                      .read(productsListControllerProvider.notifier)
                      .loadMore(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
