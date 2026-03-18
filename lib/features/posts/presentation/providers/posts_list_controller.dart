import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/core/base/paged_state.dart';
import 'package:riverpod3_starter/core/constants/api_constants.dart';
import 'package:riverpod3_starter/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_query_controller.dart';

part 'posts_list_controller.g.dart';

@riverpod
class PostsListController extends _$PostsListController {
  @override
  Future<PagedState<Post>> build() async {
    final searchTerm = ref.watch(postsQueryControllerProvider);
    final items = await ref
        .read(postsRepositoryProvider)
        .fetchPosts(
          page: 1,
          pageSize: ApiConstants.pageSize,
          searchTerm: searchTerm,
        );

    return PagedState<Post>(
      items: items,
      page: 1,
      isLoadingMore: false,
      hasMore: items.length == ApiConstants.pageSize,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading<PagedState<Post>>();
    state = await AsyncValue.guard(build);
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || current.isLoadingMore || !current.hasMore) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;
    final searchTerm = ref.read(postsQueryControllerProvider);
    final nextItems = await ref
        .read(postsRepositoryProvider)
        .fetchPosts(
          page: nextPage,
          pageSize: ApiConstants.pageSize,
          searchTerm: searchTerm,
        );

    state = AsyncData(
      current.copyWith(
        items: [...current.items, ...nextItems],
        page: nextPage,
        isLoadingMore: false,
        hasMore: nextItems.length == ApiConstants.pageSize,
      ),
    );
  }

  void addLocalPost(Post created) {
    final current = state.asData?.value;
    if (current != null) {
      state = AsyncData(current.copyWith(items: [created, ...current.items]));
    }
  }

  void replaceLocalPost(Post updated) {
    final current = state.asData?.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(
          items: current.items
              .map((item) => item.id == updated.id ? updated : item)
              .toList(),
        ),
      );
    }
  }

  void removeLocalPost(int postId) {
    final current = state.asData?.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(
          items: current.items.where((item) => item.id != postId).toList(),
        ),
      );
    }
  }
}
