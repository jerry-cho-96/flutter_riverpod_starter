import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';

extension UserModelMapper on UserModel {
  User toEntity() => User(
    id: id.toString(),
    username: username,
    name: name,
    email: email,
    imageUrl: image,
  );
}

extension UserMapper on User {
  UserModel toModel() => UserModel(
    id: int.tryParse(id) ?? 0,
    username: username,
    name: name,
    email: email,
    image: imageUrl,
  );
}

extension AuthSessionModelMapper on AuthSessionModel {
  AuthSession toEntity() => AuthSession(
    accessToken: accessToken,
    refreshToken: refreshToken,
    user: user.toEntity(),
  );
}

extension AuthSessionMapper on AuthSession {
  AuthSessionModel toModel() => AuthSessionModel(
    accessToken: accessToken,
    refreshToken: refreshToken,
    user: user.toModel(),
  );
}
