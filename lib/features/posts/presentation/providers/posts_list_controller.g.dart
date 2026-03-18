// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostsListController)
const postsListControllerProvider = PostsListControllerProvider._();

final class PostsListControllerProvider
    extends $AsyncNotifierProvider<PostsListController, PagedState<Post>> {
  const PostsListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsListControllerHash();

  @$internal
  @override
  PostsListController create() => PostsListController();
}

String _$postsListControllerHash() =>
    r'cf3f69c7d8cb6346d1f5145ec2650739817b1b7c';

abstract class _$PostsListController extends $AsyncNotifier<PagedState<Post>> {
  FutureOr<PagedState<Post>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<PagedState<Post>>, PagedState<Post>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedState<Post>>, PagedState<Post>>,
              AsyncValue<PagedState<Post>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
