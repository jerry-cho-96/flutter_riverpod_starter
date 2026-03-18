import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod3_starter/features/posts/data/models/post_model.dart';

part 'posts_page_model.freezed.dart';
part 'posts_page_model.g.dart';

@freezed
sealed class PostsPageModel with _$PostsPageModel {
  const factory PostsPageModel({
    required List<PostModel> items,
    required bool hasMore,
  }) = _PostsPageModel;

  factory PostsPageModel.fromJson(Map<String, dynamic> json) =>
      _$PostsPageModelFromJson(json);
}
