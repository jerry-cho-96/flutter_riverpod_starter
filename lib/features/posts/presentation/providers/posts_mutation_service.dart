import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/post_detail_provider.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_list_controller.dart';

part 'posts_mutation_service.g.dart';

class PostsMutationService {
  const PostsMutationService(this.ref);

  final Ref ref;

  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final created = await ref
        .read(postsRepositoryProvider)
        .createPost(userId: userId, title: title, body: body, tags: tags);
    ref.read(postsListControllerProvider.notifier).addLocalPost(created);
    return created;
  }

  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final updated = await ref
        .read(postsRepositoryProvider)
        .updatePost(postId: postId, title: title, body: body, tags: tags);
    ref.read(postsListControllerProvider.notifier).replaceLocalPost(updated);
    ref.invalidate(postDetailProvider(postId));
    return updated;
  }

  Future<void> deletePost(int postId) async {
    await ref.read(postsRepositoryProvider).deletePost(postId);
    ref.read(postsListControllerProvider.notifier).removeLocalPost(postId);
    ref.invalidate(postDetailProvider(postId));
  }
}

@riverpod
PostsMutationService postsMutationService(Ref ref) {
  return PostsMutationService(ref);
}
