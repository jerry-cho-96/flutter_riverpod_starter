import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/core/error/error_mapper.dart';
import 'package:riverpod3_starter/core/error/failure.dart';
import 'package:riverpod3_starter/core/utils/debounce.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_list_controller.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_mutation_controller.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_query_controller.dart';
import 'package:riverpod3_starter/features/posts/presentation/widgets/post_form_dialog.dart';
import 'package:riverpod3_starter/features/posts/presentation/widgets/post_list_tile.dart';
import 'package:riverpod3_starter/shared/widgets/async/async_value_view.dart';
import 'package:riverpod3_starter/shared/widgets/layout/app_scaffold.dart';

class PostsPage extends ConsumerStatefulWidget {
  const PostsPage({super.key});

  @override
  ConsumerState<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends ConsumerState<PostsPage> {
  final Debounce _searchDebounce = Debounce(
    duration: const Duration(milliseconds: 350),
  );

  @override
  void dispose() {
    _searchDebounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postsState = ref.watch(postsListControllerProvider);

    return AppScaffold(
      title: '게시글 CRUD',
      actions: [
        IconButton(
          onPressed: () async {
            final result = await showDialog<PostFormResult>(
              context: context,
              builder: (context) => const PostFormDialog(),
            );
            if (result == null || !context.mounted) {
              return;
            }
            try {
              await ref
                  .read(postsMutationControllerProvider)
                  .createPost(
                    userId: result.userId,
                    title: result.title,
                    body: result.body,
                    tags: result.tags,
                  );
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('게시글을 생성했습니다.')));
            } catch (error) {
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(_messageFromError(error))));
            }
          },
          icon: const Icon(Icons.add),
          tooltip: '게시글 생성',
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '게시글 검색',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchDebounce(() {
                  if (!mounted) {
                    return;
                  }
                  ref
                      .read(postsQueryControllerProvider.notifier)
                      .updateSearchTerm(value.trim());
                });
              },
              onSubmitted: (value) {
                ref
                    .read(postsQueryControllerProvider.notifier)
                    .updateSearchTerm(value.trim());
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(postsListControllerProvider.notifier).refresh(),
              child: AsyncValueView(
                value: postsState,
                onRetry: () =>
                    ref.read(postsListControllerProvider.notifier).refresh(),
                data: (state) => ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.items.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 24),
                        child: Center(
                          child: FilledButton.tonal(
                            onPressed: state.hasMore
                                ? () => ref
                                      .read(
                                        postsListControllerProvider.notifier,
                                      )
                                      .loadMore()
                                : null,
                            child: Text(
                              state.hasMore ? '더 불러오기' : '마지막 페이지입니다',
                            ),
                          ),
                        ),
                      );
                    }

                    final post = state.items[index];
                    return PostListTile(
                      post: post,
                      onTap: () => context.push(
                        AppRoutes.postDetail.replaceFirst(':id', '${post.id}'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _messageFromError(Object error) {
  final failure = mapErrorToFailure(error);
  return switch (failure) {
    ValidationFailure(:final message) => message,
    UnauthorizedFailure(:final message) => message,
    ForbiddenFailure(:final message) => message,
    NotFoundFailure(:final message) => message,
    ServerFailure(:final message) => message,
    NetworkFailure(:final message) => message,
    UnknownFailure(:final message) => message,
  };
}
