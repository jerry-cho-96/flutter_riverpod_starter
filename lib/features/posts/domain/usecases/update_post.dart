import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

class UpdatePost {
  const UpdatePost(this.repository);

  final PostsRepository repository;

  Future<Post> call({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) {
    return repository.updatePost(
      postId: postId,
      title: title,
      body: body,
      tags: tags,
    );
  }
}
