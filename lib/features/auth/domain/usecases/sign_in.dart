import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';

class SignIn {
  const SignIn(this.repository);

  final AuthRepository repository;

  Future<AuthSession> call({
    required String username,
    required String password,
  }) {
    return repository.signIn(username: username, password: password);
  }
}
