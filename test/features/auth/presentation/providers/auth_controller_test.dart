import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';
import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';

void main() {
  test('세션 복원 후 로그인 상태를 유지한다', () async {
    const session = AuthSession(
      accessToken: 'token',
      refreshToken: 'refresh-token',
      user: User(
        id: '1',
        username: 'emilys',
        name: 'Starter',
        email: 'lead@starter.dev',
      ),
    );
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(_FakeAuthRepository(session)),
      ],
    );
    addTearDown(container.dispose);

    final value = await container.read(authControllerProvider.future);

    expect(value?.user.email, 'lead@starter.dev');
  });

  test('signOut 이후 세션이 null이 된다', () async {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          _FakeAuthRepository(
            const AuthSession(
              accessToken: 'token',
              refreshToken: 'refresh-token',
              user: User(
                id: '1',
                username: 'emilys',
                name: 'Starter',
                email: 'lead@starter.dev',
              ),
            ),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container.read(authControllerProvider.future);
    await container.read(authControllerProvider.notifier).signOut();

    expect(container.read(authControllerProvider).asData?.value, isNull);
  });
}

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository(this.session);

  AuthSession? session;

  @override
  Future<AuthSession?> restoreSession() async => session;

  @override
  Future<AuthSession> signIn({
    required String username,
    required String password,
  }) async {
    session = AuthSession(
      accessToken: 'token',
      refreshToken: 'refresh-token',
      user: User(
        id: '1',
        username: username,
        name: 'Starter',
        email: 'lead@starter.dev',
      ),
    );
    return session!;
  }

  @override
  Future<void> signOut() async {
    session = null;
  }
}
