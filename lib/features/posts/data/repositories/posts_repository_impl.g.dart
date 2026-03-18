// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postsRemoteDataSource)
const postsRemoteDataSourceProvider = PostsRemoteDataSourceProvider._();

final class PostsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PostsRemoteDataSource,
          PostsRemoteDataSource,
          PostsRemoteDataSource
        >
    with $Provider<PostsRemoteDataSource> {
  const PostsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PostsRemoteDataSource create(Ref ref) {
    return postsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsRemoteDataSource>(value),
    );
  }
}

String _$postsRemoteDataSourceHash() =>
    r'c707d7b58e8a6aad2664c5dd9714d7e4d926dc73';
