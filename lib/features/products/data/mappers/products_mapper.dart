import 'package:riverpod3_starter/features/products/data/models/product_model.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';

extension ProductModelMapper on ProductModel {
  Product toEntity() => Product(
    id: id,
    name: name,
    description: description,
    price: price,
    category: category,
    imageUrl: imageUrl,
  );
}
