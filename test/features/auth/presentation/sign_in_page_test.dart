import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod3_starter/features/auth/presentation/pages/sign_in_page.dart';

void main() {
  testWidgets('로그인 버튼 탭 시 컨트롤러가 호출된다', (tester) async {
    final repository = _FakeAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
        child: const MaterialApp(home: SignInPage()),
      ),
    );

    await tester.pumpAndSettle();
    await tester.tap(find.text('로그인'));
    await tester.pumpAndSettle();

    expect(repository.signInCalled, isTrue);
  });
}

class _FakeAuthRepository implements AuthRepository {
  bool signInCalled = false;

  @override
  Future<AuthSession?> restoreSession() async => null;

  @override
  Future<AuthSession> signIn({
    required String username,
    required String password,
  }) async {
    signInCalled = true;
    return const AuthSession(
      accessToken: 'token',
      refreshToken: 'refresh-token',
      user: User(
        id: '1',
        username: 'emilys',
        name: 'Starter',
        email: 'lead@starter.dev',
      ),
    );
  }

  @override
  Future<void> signOut() async {}
}
