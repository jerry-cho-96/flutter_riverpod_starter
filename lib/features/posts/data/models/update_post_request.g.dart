// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdatePostRequest _$UpdatePostRequestFromJson(Map<String, dynamic> json) =>
    _UpdatePostRequest(
      title: json['title'] as String,
      body: json['body'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
    );

Map<String, dynamic> _$UpdatePostRequestToJson(_UpdatePostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'tags': instance.tags,
    };
