// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsPageModel _$ProductsPageModelFromJson(Map<String, dynamic> json) =>
    _ProductsPageModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$ProductsPageModelToJson(_ProductsPageModel instance) =>
    <String, dynamic>{'items': instance.items, 'hasMore': instance.hasMore};
