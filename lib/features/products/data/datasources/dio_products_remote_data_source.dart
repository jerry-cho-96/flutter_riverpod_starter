import 'package:dio/dio.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/features/products/data/datasources/products_remote_data_source.dart';
import 'package:riverpod3_starter/features/products/data/models/product_model.dart';
import 'package:riverpod3_starter/features/products/data/models/products_page_model.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';

class DioProductsRemoteDataSource implements ProductsRemoteDataSource {
  DioProductsRemoteDataSource(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await apiClient.dio.get<List<dynamic>>(
        '/products/category-list',
      );
      final data = response.data ?? <dynamic>[];
      return data.cast<String>();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    try {
      final data = await apiClient.getMap('/products/$productId');
      return _toProductModel(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<ProductsPageModel> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) async {
    try {
      final skip = (page - 1) * pageSize;

      final Map<String, dynamic> data;
      if (query.searchTerm.isNotEmpty) {
        data = await apiClient.getMap(
          '/products/search',
          queryParameters: <String, dynamic>{
            'q': query.searchTerm,
            'limit': pageSize,
            'skip': skip,
          },
        );
      } else if (query.category != 'all') {
        data = await apiClient.getMap(
          '/products/category/${query.category}',
          queryParameters: <String, dynamic>{'limit': pageSize, 'skip': skip},
        );
      } else {
        data = await apiClient.getMap(
          '/products',
          queryParameters: <String, dynamic>{'limit': pageSize, 'skip': skip},
        );
      }

      final items = (data['products'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => _toProductModel(item as Map<String, dynamic>))
          .toList();
      final total = data['total'] as int? ?? items.length;

      return ProductsPageModel(
        items: items,
        hasMore: skip + items.length < total,
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  ProductModel _toProductModel(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>? ?? <dynamic>[];
    return ProductModel(
      id: (json['id'] as Object).toString(),
      name: json['title'] as String? ?? '이름 없음',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      category: json['category'] as String? ?? 'unknown',
      imageUrl: images.isNotEmpty
          ? images.first as String
          : (json['thumbnail'] as String? ?? ''),
    );
  }

  AppException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;
    final message = data is Map<String, dynamic>
        ? (data['message'] as String? ?? '상품 요청에 실패했습니다.')
        : '상품 요청에 실패했습니다.';

    if (statusCode == 400) {
      return ValidationException(message);
    }
    if (statusCode == 401) {
      return UnauthorizedException(message);
    }
    if (statusCode == 403) {
      return ForbiddenException(message);
    }
    if (statusCode == 404) {
      return NotFoundException(message);
    }
    if (statusCode >= 500) {
      return ServerException(message, statusCode: statusCode);
    }
    return NetworkException(message);
  }
}
