import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

class DeletePost {
  const DeletePost(this.repository);

  final PostsRepository repository;

  Future<void> call(int postId) => repository.deletePost(postId);
}
