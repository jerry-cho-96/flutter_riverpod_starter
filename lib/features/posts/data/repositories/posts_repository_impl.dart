import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/env/app_env.dart';
import 'package:riverpod3_starter/app/di/network_provider.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/remote/dio_posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/remote/mock_posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/remote/posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/mappers/post_mapper.dart';
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
    return response.items.map((item) => item.toEntity()).toList();
  }

  @override
  Future<Post> fetchPostDetail(int postId) async {
    final post = await remoteDataSource.fetchPostDetail(postId);
    return post.toEntity();
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
    return post.toEntity();
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
    return post.toEntity();
  }

  @override
  Future<void> deletePost(int postId) {
    return remoteDataSource.deletePost(postId);
  }
}

PostsRemoteDataSource createPostsRemoteDataSource(ApiClient apiClient) {
  return DioPostsRemoteDataSource(apiClient);
}

@riverpod
PostsRemoteDataSource postsRemoteDataSource(Ref ref) {
  final env = ref.watch(appEnvProvider);
  return switch (env.apiMode) {
    ApiMode.mock => const MockPostsRemoteDataSource(),
    ApiMode.live => createPostsRemoteDataSource(ref.watch(apiClientProvider)),
  };
}
