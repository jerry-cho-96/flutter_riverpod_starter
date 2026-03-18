import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/network_provider.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/dio_posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/models/create_post_request.dart';
import 'package:riverpod3_starter/features/posts/data/models/update_post_request.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';

part 'posts_repository_impl.g.dart';

class PostsRepositoryImpl implements PostsRepository {
  const PostsRepositoryImpl(this.remoteDataSource);

  final PostsRemoteDataSource remoteDataSource;

  @override
  Future<List<Post>> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) async {
    final response = await remoteDataSource.fetchPosts(
      page: page,
      pageSize: pageSize,
      searchTerm: searchTerm,
    );
    return response.items.map((item) => Post.fromJson(item.toJson())).toList();
  }

  @override
  Future<Post> fetchPostDetail(int postId) async {
    final post = await remoteDataSource.fetchPostDetail(postId);
    return Post.fromJson(post.toJson());
  }

  @override
  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final post = await remoteDataSource.createPost(
      CreatePostRequest(userId: userId, title: title, body: body, tags: tags),
    );
    return Post.fromJson(post.toJson());
  }

  @override
  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final post = await remoteDataSource.updatePost(
      postId,
      UpdatePostRequest(title: title, body: body, tags: tags),
    );
    return Post.fromJson(post.toJson());
  }

  @override
  Future<void> deletePost(int postId) {
    return remoteDataSource.deletePost(postId);
  }
}

@riverpod
PostsRemoteDataSource postsRemoteDataSource(Ref ref) {
  return DioPostsRemoteDataSource(ref.watch(apiClientProvider));
}

@riverpod
PostsRepository postsRepository(Ref ref) {
  return PostsRepositoryImpl(ref.watch(postsRemoteDataSourceProvider));
}
