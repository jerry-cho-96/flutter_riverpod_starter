import 'package:riverpod3_starter/features/posts/data/models/create_post_request.dart';
import 'package:riverpod3_starter/features/posts/data/models/post_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/posts_page_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/update_post_request.dart';

abstract interface class PostsRemoteDataSource {
  Future<PostsPageModel> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  });

  Future<PostModel> fetchPostDetail(int postId);

  Future<PostModel> createPost(CreatePostRequest request);

  Future<PostModel> updatePost(int postId, UpdatePostRequest request);

  Future<void> deletePost(int postId);
}
