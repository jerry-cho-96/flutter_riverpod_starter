import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/feature_repository_providers.dart';
import 'package:riverpod3_starter/core/utils/extensions.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/usecases/get_post_detail.dart';
import 'package:riverpod3_starter/features/posts/presentation/providers/posts_list_controller.dart';

part 'post_detail_provider.g.dart';

@riverpod
Future<Post> postDetail(Ref ref, int postId) async {
  final cachedState = ref.watch(postsListControllerProvider).asData?.value;
  final cached = cachedState?.items.firstWhereOrNull(
    (item) => item.id == postId,
  );
  if (cached != null) {
    return cached;
  }
  return GetPostDetail(ref.watch(postsRepositoryProvider))(postId);
}
