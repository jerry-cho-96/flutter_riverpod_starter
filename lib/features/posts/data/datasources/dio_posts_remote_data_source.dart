import 'package:dio/dio.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/models/create_post_request.dart';
import 'package:riverpod3_starter/features/posts/data/models/post_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/posts_page_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/update_post_request.dart';

class DioPostsRemoteDataSource implements PostsRemoteDataSource {
  DioPostsRemoteDataSource(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PostsPageModel> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) async {
    try {
      final skip = (page - 1) * pageSize;
      final Map<String, dynamic> data;

      if (searchTerm.isNotEmpty) {
        data = await apiClient.getMap(
          '/posts/search',
          queryParameters: <String, dynamic>{
            'q': searchTerm,
            'limit': pageSize,
            'skip': skip,
          },
        );
      } else {
        data = await apiClient.getMap(
          '/posts',
          queryParameters: <String, dynamic>{'limit': pageSize, 'skip': skip},
        );
      }

      final items = (data['posts'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => PostModel.fromJson(item as Map<String, dynamic>))
          .toList();
      final total = data['total'] as int? ?? items.length;

      return PostsPageModel(items: items, hasMore: skip + items.length < total);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<PostModel> fetchPostDetail(int postId) async {
    try {
      final data = await apiClient.getMap('/posts/$postId');
      return PostModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<PostModel> createPost(CreatePostRequest request) async {
    try {
      final data = await apiClient.postMap(
        '/posts/add',
        data: request.toJson(),
      );
      return PostModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<PostModel> updatePost(int postId, UpdatePostRequest request) async {
    try {
      final data = await apiClient.putMap(
        '/posts/$postId',
        data: request.toJson(),
      );
      return PostModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<void> deletePost(int postId) async {
    try {
      await apiClient.deleteMap('/posts/$postId');
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  AppException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;
    final message = data is Map<String, dynamic>
        ? (data['message'] as String? ?? '게시글 요청에 실패했습니다.')
        : '게시글 요청에 실패했습니다.';

    if (statusCode == 400) {
      return ValidationException(message);
    }
    if (statusCode == 401) {
      return UnauthorizedException(message);
    }
    if (statusCode == 403) {
      return ForbiddenException(message);
    }
    if (statusCode == 404) {
      return NotFoundException(message);
    }
    if (statusCode >= 500) {
      return ServerException(message, statusCode: statusCode);
    }
    return NetworkException(message);
  }
}
