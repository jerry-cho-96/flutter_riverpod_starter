import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

@freezed
sealed class AuthSessionModel with _$AuthSessionModel {
  const factory AuthSessionModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);
}
