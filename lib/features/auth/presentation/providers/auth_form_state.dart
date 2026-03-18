import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_state.freezed.dart';

@freezed
sealed class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default('emilys') String username,
    @Default('emilyspass') String password,
  }) = _AuthFormState;
}
