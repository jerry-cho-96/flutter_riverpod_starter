import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';

class SignOut {
  const SignOut(this.repository);

  final AuthRepository repository;

  Future<void> call() => repository.signOut();
}
