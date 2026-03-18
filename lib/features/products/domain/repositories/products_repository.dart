import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';

abstract interface class ProductsRepository {
  Future<List<String>> getCategories();

  Future<List<Product>> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  });

  Future<Product> getProductDetail(String productId);
}
