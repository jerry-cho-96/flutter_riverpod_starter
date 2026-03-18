import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/products/data/repositories/products_repository_impl.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';
import 'package:riverpod3_starter/features/products/presentation/providers/products_list_controller.dart';

void main() {
  test('loadMore 시 다음 페이지를 누적한다', () async {
    final container = ProviderContainer(
      overrides: [
        productsRepositoryProvider.overrideWithValue(_FakeProductsRepository()),
      ],
    );
    addTearDown(container.dispose);

    final firstPage = await container.read(
      productsListControllerProvider.future,
    );
    expect(firstPage.items.length, 10);

    await container.read(productsListControllerProvider.notifier).loadMore();

    final nextState = container
        .read(productsListControllerProvider)
        .asData
        ?.value;
    expect(nextState?.items.length, 12);
    expect(nextState?.hasMore, isFalse);
  });
}

class _FakeProductsRepository implements ProductsRepository {
  @override
  Future<List<String>> getCategories() async => <String>[
    'beauty',
    'fragrances',
  ];

  @override
  Future<Product> getProductDetail(String productId) async {
    return Product(
      id: productId,
      name: 'Product',
      description: 'Description',
      price: 10,
      category: 'all',
      imageUrl: '',
    );
  }

  @override
  Future<List<Product>> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) async {
    if (page == 1) {
      return List.generate(
        10,
        (index) => Product(
          id: 'p$index',
          name: 'Item $index',
          description: 'Desc',
          price: 10,
          category: query.category,
          imageUrl: '',
        ),
      );
    }

    return List.generate(
      2,
      (index) => Product(
        id: 'p${index + 3}',
        name: 'Item ${index + 3}',
        description: 'Desc',
        price: 10,
        category: query.category,
        imageUrl: '',
      ),
    );
  }
}
