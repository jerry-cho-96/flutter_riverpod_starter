import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/app/di/feature_repository_providers.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_list_controller.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_mutation_controller.dart';

void main() {
  test('게시글 loadMore 시 다음 페이지를 누적한다', () async {
    final container = ProviderContainer(
      overrides: [
        postsRepositoryProvider.overrideWithValue(_FakePostsRepository()),
      ],
    );
    addTearDown(container.dispose);

    final firstPage = await container.read(postsListControllerProvider.future);
    expect(firstPage.items.length, 10);

    await container.read(postsListControllerProvider.notifier).loadMore();

    final nextState = container.read(postsListControllerProvider).asData?.value;
    expect(nextState?.items.length, 12);
    expect(nextState?.hasMore, isFalse);
  });

  test('게시글 create/update/delete 시 로컬 상태를 반영한다', () async {
    final container = ProviderContainer(
      overrides: [
        postsRepositoryProvider.overrideWithValue(_FakePostsRepository()),
      ],
    );
    addTearDown(container.dispose);

    await container.read(postsListControllerProvider.future);

    final created = await container
        .read(postsMutationControllerProvider)
        .createPost(userId: 7, title: '새 글', body: '본문', tags: const ['new']);
    expect(created.title, '새 글');

    final updated = await container
        .read(postsMutationControllerProvider)
        .updatePost(postId: created.id, title: '수정 글', body: '수정 본문');
    expect(updated.title, '수정 글');

    await container
        .read(postsMutationControllerProvider)
        .deletePost(created.id);

    final state = container.read(postsListControllerProvider).asData?.value;
    expect(state?.items.any((item) => item.id == created.id), isFalse);
  });
}

class _FakePostsRepository implements PostsRepository {
  final List<Post> _items = List.generate(
    12,
    (index) => Post(
      id: index + 1,
      userId: 1,
      title: '게시글 ${index + 1}',
      body: '본문 ${index + 1}',
    ),
  );

  @override
  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final post = Post(
      id: 99,
      userId: userId,
      title: title,
      body: body,
      tags: tags,
    );
    _items.insert(0, post);
    return post;
  }

  @override
  Future<void> deletePost(int postId) async {
    _items.removeWhere((item) => item.id == postId);
  }

  @override
  Future<Post> fetchPostDetail(int postId) async {
    return _items.firstWhere((item) => item.id == postId);
  }

  @override
  Future<List<Post>> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) async {
    final start = (page - 1) * pageSize;
    final end = (start + pageSize).clamp(0, _items.length);
    return _items.sublist(start, end);
  }

  @override
  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final index = _items.indexWhere((item) => item.id == postId);
    final updated = _items[index].copyWith(
      title: title,
      body: body,
      tags: tags,
    );
    _items[index] = updated;
    return updated;
  }
}
