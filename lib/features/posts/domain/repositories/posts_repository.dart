import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';

abstract interface class PostsRepository {
  Future<List<Post>> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  });

  Future<Post> fetchPostDetail(int postId);

  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  });

  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  });

  Future<void> deletePost(int postId);
}
