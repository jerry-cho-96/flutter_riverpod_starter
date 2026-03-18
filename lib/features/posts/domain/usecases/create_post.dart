import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

class CreatePost {
  const CreatePost(this.repository);

  final PostsRepository repository;

  Future<Post> call({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) {
    return repository.createPost(
      userId: userId,
      title: title,
      body: body,
      tags: tags,
    );
  }
}
