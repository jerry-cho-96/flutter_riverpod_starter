import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/feature_repository_providers.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/usecases/create_post.dart';
import 'package:riverpod3_starter/features/posts/domain/usecases/delete_post.dart';
import 'package:riverpod3_starter/features/posts/domain/usecases/update_post.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/post_detail_provider.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_list_controller.dart';

part 'posts_mutation_controller.g.dart';

class PostsMutationController {
  const PostsMutationController(this.ref);

  final Ref ref;

  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final created = await CreatePost(ref.read(postsRepositoryProvider))(
      userId: userId,
      title: title,
      body: body,
      tags: tags,
    );
    ref.read(postsListControllerProvider.notifier).addLocalPost(created);
    return created;
  }

  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    final updated = await UpdatePost(ref.read(postsRepositoryProvider))(
      postId: postId,
      title: title,
      body: body,
      tags: tags,
    );
    ref.read(postsListControllerProvider.notifier).replaceLocalPost(updated);
    ref.invalidate(postDetailProvider(postId));
    return updated;
  }

  Future<void> deletePost(int postId) async {
    await DeletePost(ref.read(postsRepositoryProvider))(postId);
    ref.read(postsListControllerProvider.notifier).removeLocalPost(postId);
    ref.invalidate(postDetailProvider(postId));
  }
}

@riverpod
PostsMutationController postsMutationController(Ref ref) {
  return PostsMutationController(ref);
}
