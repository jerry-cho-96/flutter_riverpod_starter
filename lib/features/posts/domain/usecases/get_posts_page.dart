import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

class GetPostsPage {
  const GetPostsPage(this.repository);

  final PostsRepository repository;

  Future<List<Post>> call({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) {
    return repository.fetchPosts(
      page: page,
      pageSize: pageSize,
      searchTerm: searchTerm,
    );
  }
}
