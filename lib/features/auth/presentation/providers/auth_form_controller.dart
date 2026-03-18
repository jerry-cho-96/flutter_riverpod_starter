import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/auth/presentation/providers/auth_form_state.dart';

part 'auth_form_controller.g.dart';

@riverpod
class AuthFormController extends _$AuthFormController {
  @override
  AuthFormState build() => const AuthFormState();

  void updateUsername(String value) {
    state = state.copyWith(username: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
}
