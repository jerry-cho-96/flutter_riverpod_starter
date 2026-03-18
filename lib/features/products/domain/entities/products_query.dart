import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_query.freezed.dart';
part 'products_query.g.dart';

@freezed
sealed class ProductsQuery with _$ProductsQuery {
  const factory ProductsQuery({
    @Default('all') String category,
    @Default('') String searchTerm,
  }) = _ProductsQuery;

  factory ProductsQuery.fromJson(Map<String, dynamic> json) =>
      _$ProductsQueryFromJson(json);
}
