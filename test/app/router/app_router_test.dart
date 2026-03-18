import 'package:flutter_test/flutter_test.dart';

import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/app/router/route_guards.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';

void main() {
  group('authRedirect', () {
    test('비인증 사용자는 sign-in으로 이동한다', () {
      final redirect = authRedirect(
        session: null,
        isLoadingSession: false,
        matchedLocation: AppRoutes.home,
      );

      expect(redirect, AppRoutes.signIn);
    });

    test('인증된 사용자는 sign-in 접근 시 home으로 이동한다', () {
      const session = AuthSession(
        accessToken: 'token',
        refreshToken: 'refresh-token',
        user: User(
          id: '1',
          username: 'emilys',
          name: 'Jerry',
          email: 'lead@starter.dev',
        ),
      );

      final redirect = authRedirect(
        session: session,
        isLoadingSession: false,
        matchedLocation: AppRoutes.signIn,
      );

      expect(redirect, AppRoutes.home);
    });
  });
}
