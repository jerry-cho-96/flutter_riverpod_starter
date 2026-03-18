import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod3_starter/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:riverpod3_starter/features/products/data/repositories/products_repository_impl.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';

part 'feature_repository_providers.g.dart';

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

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localDataSource: ref.watch(authLocalDataSourceProvider),
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ProductsRepositoryImpl(ref.watch(productsRemoteDataSourceProvider));
}

@riverpod
PostsRepository postsRepository(Ref ref) {
  return PostsRepositoryImpl(ref.watch(postsRemoteDataSourceProvider));
}
