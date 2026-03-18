import 'package:riverpod3_starter/features/posts/data/models/post_model.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';

extension PostMapper on PostModel {
  Post toEntity() => Post(
    id: id,
    userId: userId,
    title: title,
    body: body,
    tags: tags,
    likes: likes,
    dislikes: dislikes,
    views: views,
  );
}
