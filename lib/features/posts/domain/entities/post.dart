import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
sealed class Post with _$Post {
  const factory Post({
    required int id,
    required int userId,
    required String title,
    required String body,
    @Default(<String>[]) List<String> tags,
    @Default(0) int likes,
    @Default(0) int dislikes,
    @Default(0) int views,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
