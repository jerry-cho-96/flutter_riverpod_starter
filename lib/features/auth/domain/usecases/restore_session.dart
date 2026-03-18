import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';

class RestoreSession {
  const RestoreSession(this.repository);

  final AuthRepository repository;

  Future<AuthSession?> call() => repository.restoreSession();
}
