import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/products/presentation/providers/products_query_controller.dart';

part 'selected_category_provider.g.dart';

@riverpod
String selectedCategory(Ref ref) {
  return ref.watch(productsQueryControllerProvider).category;
}
