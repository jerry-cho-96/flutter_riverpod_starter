import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/network_provider.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/dio_auth_remote_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/mappers/auth_mapper.dart';
import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/sign_in_request.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<AuthSession?> restoreSession() async {
    final localSession = await localDataSource.restoreSession();
    if (localSession == null) {
      return null;
    }

    try {
      final refreshedTokens = await remoteDataSource.refreshSession(
        RefreshTokenRequest(refreshToken: localSession.refreshToken),
      );
      final currentUser = await remoteDataSource.getCurrentUser(
        refreshedTokens.accessToken,
      );
      final refreshedSession = AuthSessionModel(
        accessToken: refreshedTokens.accessToken,
        refreshToken: refreshedTokens.refreshToken,
        user: currentUser,
      );
      await localDataSource.persistSession(refreshedSession);
      return refreshedSession.toEntity();
    } catch (_) {
      await localDataSource.clear();
      return null;
    }
  }

  @override
  Future<AuthSession> signIn({
    required String username,
    required String password,
  }) async {
    final sessionModel = await remoteDataSource.signIn(
      SignInRequest(username: username, password: password),
    );
    await localDataSource.persistSession(sessionModel);
    return sessionModel.toEntity();
  }

  @override
  Future<void> signOut() {
    return localDataSource.clear();
  }
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return DioAuthRemoteDataSource(ref.watch(apiClientProvider));
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localDataSource: ref.watch(authLocalDataSourceProvider),
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
}
