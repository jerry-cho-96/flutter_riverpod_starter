import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';

class GetProductDetail {
  const GetProductDetail(this.repository);

  final ProductsRepository repository;

  Future<Product> call(String productId) =>
      repository.getProductDetail(productId);
}
