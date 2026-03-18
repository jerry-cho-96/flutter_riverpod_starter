import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:riverpod3_starter/core/storage/secure_storage_service.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_response.dart';
import 'package:riverpod3_starter/features/auth/data/models/sign_in_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';
import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';

void main() {
  group('AuthRepositoryImpl', () {
    test('로그인 후 세션을 저장한다', () async {
      final local = _FakeAuthLocalDataSource();
      final repository = AuthRepositoryImpl(
        localDataSource: local,
        remoteDataSource: _FakeAuthRemoteDataSource(),
      );

      final session = await repository.signIn(
        username: 'emilys',
        password: 'emilyspass',
      );

      expect(session.user.username, 'emilys');
      expect(local.savedSession?.accessToken, 'mock-token');
    });

    test('로그아웃 시 세션을 제거한다', () async {
      final local = _FakeAuthLocalDataSource();
      final repository = AuthRepositoryImpl(
        localDataSource: local,
        remoteDataSource: _FakeAuthRemoteDataSource(),
      );

      await repository.signOut();

      expect(local.cleared, isTrue);
    });
  });
}

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<AuthSessionModel> signIn(SignInRequest request) async {
    return AuthSessionModel(
      accessToken: 'mock-token',
      refreshToken: 'mock-refresh-token',
      user: UserModel(
        id: 1,
        username: request.username,
        name: 'Starter Admin',
        email: 'emily.johnson@x.dummyjson.com',
      ),
    );
  }

  @override
  Future<UserModel> getCurrentUser(String accessToken) async {
    return const UserModel(
      id: 1,
      username: 'emilys',
      name: 'Starter Admin',
      email: 'emily.johnson@x.dummyjson.com',
    );
  }

  @override
  Future<RefreshTokenResponse> refreshSession(
    RefreshTokenRequest request,
  ) async {
    return const RefreshTokenResponse(
      accessToken: 'next-token',
      refreshToken: 'next-refresh-token',
    );
  }
}

class _FakeAuthLocalDataSource extends AuthLocalDataSource {
  _FakeAuthLocalDataSource()
    : super(SecureStorageService(const FlutterSecureStorage()));

  AuthSessionModel? savedSession;
  bool cleared = false;

  @override
  Future<void> persistSession(AuthSessionModel session) async {
    savedSession = session;
  }

  @override
  Future<void> clear() async {
    cleared = true;
  }
}
