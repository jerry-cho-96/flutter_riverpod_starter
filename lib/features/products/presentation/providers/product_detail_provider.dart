import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/products/data/repositories/products_repository_impl.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';

part 'product_detail_provider.g.dart';

@riverpod
Future<Product> productDetail(Ref ref, String productId) {
  return ref.watch(productsRepositoryProvider).getProductDetail(productId);
}
