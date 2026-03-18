import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthSession?> build() {
    return ref.watch(authRepositoryProvider).restoreSession();
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading<AuthSession?>();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .signIn(username: username, password: password),
    );
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData<AuthSession?>(null);
  }
}
