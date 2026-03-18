import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/core/error/error_mapper.dart';
import 'package:riverpod3_starter/core/error/failure.dart';
import 'package:riverpod3_starter/core/widgets/async_value_view.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/post_detail_provider.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_mutation_service.dart';
import 'package:riverpod3_starter/features/posts/presentation/widgets/post_form_dialog.dart';
import 'package:riverpod3_starter/shared/widgets/app_scaffold.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({required this.postId, super.key});

  final int postId;

  Future<void> _handleEdit(
    BuildContext context,
    WidgetRef ref,
    Post item,
  ) async {
    final result = await showDialog<PostFormResult>(
      context: context,
      builder: (context) => PostFormDialog(
        initialUserId: item.userId,
        initialTitle: item.title,
        initialBody: item.body,
        initialTags: item.tags,
        isEdit: true,
      ),
    );
    if (result == null || !context.mounted) {
      return;
    }

    try {
      await ref
          .read(postsMutationServiceProvider)
          .updatePost(
            postId: item.id,
            title: result.title,
            body: result.body,
            tags: result.tags,
          );
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('게시글을 수정했습니다.')));
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_messageFromError(error))));
    }
  }

  Future<void> _handleDelete(
    BuildContext context,
    WidgetRef ref,
    Post item,
  ) async {
    try {
      await ref.read(postsMutationServiceProvider).deletePost(item.id);
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('게시글을 삭제했습니다.')));
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_messageFromError(error))));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postDetailProvider(postId));

    return AppScaffold(
      title: '게시글 상세',
      body: AsyncValueView(
        value: post,
        data: (item) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text('userId: ${item.userId} / id: ${item.id}'),
                    const SizedBox(height: 8),
                    Text('likes: ${item.likes} / dislikes: ${item.dislikes}'),
                    const SizedBox(height: 8),
                    Text('views: ${item.views}'),
                    const SizedBox(height: 16),
                    Text(item.body),
                    if (item.tags.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final tag in item.tags) Chip(label: Text(tag)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () => _handleEdit(context, ref, item),
              child: const Text('게시글 수정'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => _handleDelete(context, ref, item),
              child: const Text('게시글 삭제'),
            ),
          ],
        ),
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
