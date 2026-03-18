import 'package:riverpod3_starter/features/products/data/models/product_model.dart';
import 'package:riverpod3_starter/features/products/data/models/products_page_model.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<String>> getCategories();

  Future<ProductsPageModel> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  });

  Future<ProductModel> getProductDetail(String productId);
}
