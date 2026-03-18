import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/features/posts/data/datasources/remote/posts_remote_data_source.dart';
import 'package:riverpod3_starter/features/posts/data/models/create_post_request.dart';
import 'package:riverpod3_starter/features/posts/data/models/post_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/posts_page_model.dart';
import 'package:riverpod3_starter/features/posts/data/models/update_post_request.dart';

class MockPostsRemoteDataSource implements PostsRemoteDataSource {
  const MockPostsRemoteDataSource();

  static final List<PostModel> _seedPosts = List<PostModel>.generate(
    12,
    (index) => PostModel(
      id: index + 1,
      userId: 1,
      title: 'Mock 게시글 ${index + 1}',
      body: 'Mock 본문 ${index + 1}',
      tags: <String>[if (index.isEven) 'news' else 'update'],
      views: 10 + index,
    ),
  );

  static final List<PostModel> _posts = List<PostModel>.from(_seedPosts);

  @override
  Future<PostsPageModel> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    final normalized = searchTerm.trim().toLowerCase();
    final filtered = _posts.where((item) {
      if (normalized.isEmpty) {
        return true;
      }
      return item.title.toLowerCase().contains(normalized) ||
          item.body.toLowerCase().contains(normalized);
    }).toList();

    final start = (page - 1) * pageSize;
    if (start >= filtered.length) {
      return const PostsPageModel(items: <PostModel>[], hasMore: false);
    }

    final end = (start + pageSize).clamp(0, filtered.length);
    return PostsPageModel(
      items: filtered.sublist(start, end),
      hasMore: end < filtered.length,
    );
  }

  @override
  Future<PostModel> fetchPostDetail(int postId) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));

    final post = _findPost(postId);
    if (post == null) {
      throw const NotFoundException('게시글을 찾을 수 없습니다.');
    }
    return post;
  }

  @override
  Future<PostModel> createPost(CreatePostRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    final nextId = (_posts.map((item) => item.id).fold<int>(0, _max)) + 1;
    final created = PostModel(
      id: nextId,
      userId: request.userId,
      title: request.title,
      body: request.body,
      tags: request.tags,
    );
    _posts.insert(0, created);
    return created;
  }

  @override
  Future<PostModel> updatePost(int postId, UpdatePostRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    final index = _posts.indexWhere((item) => item.id == postId);
    if (index < 0) {
      throw const NotFoundException('게시글을 찾을 수 없습니다.');
    }

    final current = _posts[index];
    final updated = current.copyWith(
      title: request.title,
      body: request.body,
      tags: request.tags,
    );
    _posts[index] = updated;
    return updated;
  }

  @override
  Future<void> deletePost(int postId) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));

    final index = _posts.indexWhere((item) => item.id == postId);
    if (index < 0) {
      throw const NotFoundException('게시글을 찾을 수 없습니다.');
    }
    _posts.removeAt(index);
  }

  PostModel? _findPost(int postId) {
    for (final post in _posts) {
      if (post.id == postId) {
        return post;
      }
    }
    return null;
  }

  static int _max(int current, int next) => current > next ? current : next;
}
