import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/core/base/paged_state.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/presentation/widgets/product_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    required this.state,
    required this.onLoadMore,
    super.key,
  });

  final PagedState<Product> state;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.items.length + 1,
      itemBuilder: (context, index) {
        if (index == state.items.length) {
          if (!state.hasMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: Text('마지막 페이지입니다.')),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: OutlinedButton(
                onPressed: state.isLoadingMore ? null : onLoadMore,
                child: state.isLoadingMore
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('더 불러오기'),
              ),
            ),
          );
        }

        final product = state.items[index];
        return ProductCard(
          product: product,
          onTap: () => context.push(
            AppRoutes.productDetail.replaceFirst(':id', product.id),
          ),
        );
      },
    );
  }
}
