import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_response.dart';
import 'package:riverpod3_starter/features/auth/data/models/sign_in_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthSessionModel> signIn(SignInRequest request);
  Future<UserModel> getCurrentUser(String accessToken);
  Future<RefreshTokenResponse> refreshSession(RefreshTokenRequest request);
}
