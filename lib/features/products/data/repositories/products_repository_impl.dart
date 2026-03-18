import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/env/app_env.dart';
import 'package:riverpod3_starter/app/di/network_provider.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/features/products/data/datasources/remote/dio_products_remote_data_source.dart';
import 'package:riverpod3_starter/features/products/data/datasources/remote/mock_products_remote_data_source.dart';
import 'package:riverpod3_starter/features/products/data/datasources/remote/products_remote_data_source.dart';
import 'package:riverpod3_starter/features/products/data/mappers/product_mapper.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';

part 'products_repository_impl.g.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl(this.remoteDataSource);

  final ProductsRemoteDataSource remoteDataSource;

  @override
  Future<List<String>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<Product> getProductDetail(String productId) async {
    final model = await remoteDataSource.getProductDetail(productId);
    return model.toEntity();
  }

  @override
  Future<List<Product>> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) async {
    final response = await remoteDataSource.getProductsPage(
      query: query,
      page: page,
      pageSize: pageSize,
    );
    return response.items.map((item) => item.toEntity()).toList();
  }
}

ProductsRemoteDataSource createProductsRemoteDataSource(ApiClient apiClient) {
  return DioProductsRemoteDataSource(apiClient);
}

@riverpod
ProductsRemoteDataSource productsRemoteDataSource(Ref ref) {
  final env = ref.watch(appEnvProvider);
  return switch (env.apiMode) {
    ApiMode.mock => const MockProductsRemoteDataSource(),
    ApiMode.live => createProductsRemoteDataSource(
      ref.watch(apiClientProvider),
    ),
  };
}
