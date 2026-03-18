// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_query_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostsQueryController)
const postsQueryControllerProvider = PostsQueryControllerProvider._();

final class PostsQueryControllerProvider
    extends $NotifierProvider<PostsQueryController, String> {
  const PostsQueryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsQueryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsQueryControllerHash();

  @$internal
  @override
  PostsQueryController create() => PostsQueryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$postsQueryControllerHash() =>
    r'ffc0ad75aa432c2146460a479df89c2875890234';

abstract class _$PostsQueryController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
