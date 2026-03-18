// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostsPageModel _$PostsPageModelFromJson(Map<String, dynamic> json) =>
    _PostsPageModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$PostsPageModelToJson(_PostsPageModel instance) =>
    <String, dynamic>{'items': instance.items, 'hasMore': instance.hasMore};
