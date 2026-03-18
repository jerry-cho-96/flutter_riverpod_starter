// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_mutation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postsMutationService)
const postsMutationServiceProvider = PostsMutationServiceProvider._();

final class PostsMutationServiceProvider
    extends
        $FunctionalProvider<
          PostsMutationService,
          PostsMutationService,
          PostsMutationService
        >
    with $Provider<PostsMutationService> {
  const PostsMutationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsMutationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsMutationServiceHash();

  @$internal
  @override
  $ProviderElement<PostsMutationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostsMutationService create(Ref ref) {
    return postsMutationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsMutationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsMutationService>(value),
    );
  }
}

String _$postsMutationServiceHash() =>
    r'2299392e30029c82d3be14eb372a2f484c8aae4a';
