import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod3_starter/features/products/data/models/product_model.dart';

part 'products_page_model.freezed.dart';
part 'products_page_model.g.dart';

@freezed
sealed class ProductsPageModel with _$ProductsPageModel {
  const factory ProductsPageModel({
    required List<ProductModel> items,
    required bool hasMore,
  }) = _ProductsPageModel;

  factory ProductsPageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsPageModelFromJson(json);
}
