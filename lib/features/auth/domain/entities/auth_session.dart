import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

@freezed
sealed class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
