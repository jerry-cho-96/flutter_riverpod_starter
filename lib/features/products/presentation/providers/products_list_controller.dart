import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/feature_repository_providers.dart';
import 'package:riverpod3_starter/core/base/paged_state.dart';
import 'package:riverpod3_starter/core/constants/api_constants.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/presentation/providers/products_query_controller.dart';

part 'products_list_controller.g.dart';

@riverpod
class ProductsListController extends _$ProductsListController {
  @override
  Future<PagedState<Product>> build() async {
    final query = ref.watch(productsQueryControllerProvider);
    final items = await ref
        .read(productsRepositoryProvider)
        .getProductsPage(
          query: query,
          page: 1,
          pageSize: ApiConstants.pageSize,
        );

    return PagedState<Product>(
      items: items,
      page: 1,
      isLoadingMore: false,
      hasMore: items.length == ApiConstants.pageSize,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading<PagedState<Product>>();
    state = await AsyncValue.guard(build);
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || current.isLoadingMore || !current.hasMore) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));

    final query = ref.read(productsQueryControllerProvider);
    final nextPage = current.page + 1;
    final nextItems = await ref
        .read(productsRepositoryProvider)
        .getProductsPage(
          query: query,
          page: nextPage,
          pageSize: ApiConstants.pageSize,
        );

    state = AsyncData(
      current.copyWith(
        items: [...current.items, ...nextItems],
        page: nextPage,
        isLoadingMore: false,
        hasMore: nextItems.length == ApiConstants.pageSize,
      ),
    );
  }
}
