import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/feature_repository_providers.dart';

part 'product_categories_provider.g.dart';

@riverpod
Future<List<String>> productCategories(Ref ref) {
  return ref.watch(productsRepositoryProvider).getCategories();
}
