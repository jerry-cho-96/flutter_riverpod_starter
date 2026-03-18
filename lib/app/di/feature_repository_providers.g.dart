// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Feature repository binding 전용 파일이다.
///
/// 이 파일에는 아래만 둔다.
/// - repository interface ↔ implementation binding
/// - mock/live 등 data 구현 분기
/// - feature 외부에서 공통 사용되는 최상위 repository provider
///
/// 이 파일에 두지 않는다.
/// - controller
/// - UI state provider
/// - query/filter provider
/// - presentation 파생 provider
/// - feature 전용 mutation provider

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// Feature repository binding 전용 파일이다.
///
/// 이 파일에는 아래만 둔다.
/// - repository interface ↔ implementation binding
/// - mock/live 등 data 구현 분기
/// - feature 외부에서 공통 사용되는 최상위 repository provider
///
/// 이 파일에 두지 않는다.
/// - controller
/// - UI state provider
/// - query/filter provider
/// - presentation 파생 provider
/// - feature 전용 mutation provider

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Feature repository binding 전용 파일이다.
  ///
  /// 이 파일에는 아래만 둔다.
  /// - repository interface ↔ implementation binding
  /// - mock/live 등 data 구현 분기
  /// - feature 외부에서 공통 사용되는 최상위 repository provider
  ///
  /// 이 파일에 두지 않는다.
  /// - controller
  /// - UI state provider
  /// - query/filter provider
  /// - presentation 파생 provider
  /// - feature 전용 mutation provider
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'ddc1bd7dede293440f367d62836e29e34e13c213';

@ProviderFor(productsRepository)
const productsRepositoryProvider = ProductsRepositoryProvider._();

final class ProductsRepositoryProvider
    extends
        $FunctionalProvider<
          ProductsRepository,
          ProductsRepository,
          ProductsRepository
        >
    with $Provider<ProductsRepository> {
  const ProductsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRepository create(Ref ref) {
    return productsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRepository>(value),
    );
  }
}

String _$productsRepositoryHash() =>
    r'ad728c296832017458f9677a0e5595a421f6c2dd';

@ProviderFor(postsRepository)
const postsRepositoryProvider = PostsRepositoryProvider._();

final class PostsRepositoryProvider
    extends
        $FunctionalProvider<PostsRepository, PostsRepository, PostsRepository>
    with $Provider<PostsRepository> {
  const PostsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostsRepository create(Ref ref) {
    return postsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsRepository>(value),
    );
  }
}

String _$postsRepositoryHash() => r'ccf70ef9b27d82f0ffb5cce257fa3b06e2590292';
