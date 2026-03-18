// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_mutation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postsMutationController)
const postsMutationControllerProvider = PostsMutationControllerProvider._();

final class PostsMutationControllerProvider
    extends
        $FunctionalProvider<
          PostsMutationController,
          PostsMutationController,
          PostsMutationController
        >
    with $Provider<PostsMutationController> {
  const PostsMutationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsMutationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsMutationControllerHash();

  @$internal
  @override
  $ProviderElement<PostsMutationController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostsMutationController create(Ref ref) {
    return postsMutationController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsMutationController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsMutationController>(value),
    );
  }
}

String _$postsMutationControllerHash() =>
    r'7e6a6a77e80bb2cea044c742fd8b4fe67c9a053a';
