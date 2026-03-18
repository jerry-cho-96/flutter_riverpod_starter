import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

class GetPostDetail {
  const GetPostDetail(this.repository);

  final PostsRepository repository;

  Future<Post> call(int postId) => repository.fetchPostDetail(postId);
}
