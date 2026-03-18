import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';

class GetProductsPage {
  const GetProductsPage(this.repository);

  final ProductsRepository repository;

  Future<List<Product>> call({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) {
    return repository.getProductsPage(
      query: query,
      page: page,
      pageSize: pageSize,
    );
  }
}
