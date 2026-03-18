// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsQuery _$ProductsQueryFromJson(Map<String, dynamic> json) =>
    _ProductsQuery(
      category: json['category'] as String? ?? 'all',
      searchTerm: json['searchTerm'] as String? ?? '',
    );

Map<String, dynamic> _$ProductsQueryToJson(_ProductsQuery instance) =>
    <String, dynamic>{
      'category': instance.category,
      'searchTerm': instance.searchTerm,
    };
