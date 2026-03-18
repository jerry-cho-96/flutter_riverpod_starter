import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';

part 'products_query_controller.g.dart';

@riverpod
class ProductsQueryController extends _$ProductsQueryController {
  @override
  ProductsQuery build() => const ProductsQuery();

  void selectCategory(String category) {
    state = state.copyWith(category: category);
  }

  void updateSearchTerm(String value) {
    state = state.copyWith(searchTerm: value);
  }
}
