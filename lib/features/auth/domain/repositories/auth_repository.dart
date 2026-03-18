import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';

abstract interface class AuthRepository {
  Future<AuthSession?> restoreSession();
  Future<AuthSession> signIn({
    required String username,
    required String password,
  });
  Future<void> signOut();
}
