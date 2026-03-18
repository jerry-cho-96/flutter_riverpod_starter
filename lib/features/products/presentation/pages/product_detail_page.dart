import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/core/widgets/async_value_view.dart';
import 'package:riverpod3_starter/features/products/presentation/providers/product_detail_provider.dart';
import 'package:riverpod3_starter/shared/widgets/app_scaffold.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({required this.productId, super.key});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productDetailProvider(productId));

    return AppScaffold(
      title: '상품 상세',
      body: AsyncValueView(
        value: product,
        data: (item) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(item.description),
                    const SizedBox(height: 16),
                    Text('카테고리: ${item.category}'),
                    const SizedBox(height: 8),
                    Text('가격: \$${item.price.toStringAsFixed(1)}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
