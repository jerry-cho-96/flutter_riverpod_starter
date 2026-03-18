import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/core/utils/extensions.dart';
import 'package:riverpod3_starter/features/products/data/datasources/remote/products_remote_data_source.dart';
import 'package:riverpod3_starter/features/products/data/models/product_model.dart';
import 'package:riverpod3_starter/features/products/data/models/products_page_model.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';

class MockProductsRemoteDataSource implements ProductsRemoteDataSource {
  const MockProductsRemoteDataSource();

  Future<List<ProductModel>> _loadProducts() async {
    final raw = await rootBundle.loadString('assets/mocks/products.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<String>> getCategories() async {
    final products = await _loadProducts();
    final categories = products.map((item) => item.category).toSet().toList()
      ..sort();
    return categories;
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    final products = await _loadProducts();
    final product = products.firstWhereOrNull((item) => item.id == productId);
    if (product == null) {
      throw const NotFoundException('상품을 찾을 수 없습니다.');
    }
    return product;
  }

  @override
  Future<ProductsPageModel> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final products = await _loadProducts();

    final filtered = products.where((item) {
      final categoryMatches =
          query.category == 'all' || item.category == query.category;
      final searchMatches =
          query.searchTerm.isEmpty ||
          item.name.toLowerCase().contains(query.searchTerm.toLowerCase());
      return categoryMatches && searchMatches;
    }).toList();

    final start = (page - 1) * pageSize;
    if (start >= filtered.length) {
      return const ProductsPageModel(items: <ProductModel>[], hasMore: false);
    }
    final end = (start + pageSize).clamp(0, filtered.length);

    return ProductsPageModel(
      items: filtered.sublist(start, end),
      hasMore: end < filtered.length,
    );
  }
}
