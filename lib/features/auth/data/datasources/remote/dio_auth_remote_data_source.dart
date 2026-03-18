import 'package:dio/dio.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_response.dart';
import 'package:riverpod3_starter/features/auth/data/models/sign_in_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';

class DioAuthRemoteDataSource implements AuthRemoteDataSource {
  DioAuthRemoteDataSource(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<AuthSessionModel> signIn(SignInRequest request) async {
    try {
      final response = await apiClient.dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: request.toJson(),
        options: Options(
          extra: const <String, dynamic>{'skipAuth': true, 'skipRefresh': true},
        ),
      );
      final data = response.data ?? <String, dynamic>{};
      return AuthSessionModel(
        accessToken: data['accessToken'] as String,
        refreshToken: data['refreshToken'] as String,
        user: UserModel(
          id: data['id'] as int,
          username: data['username'] as String,
          name: '${data['firstName']} ${data['lastName']}'.trim(),
          email: data['email'] as String,
          image: data['image'] as String?,
        ),
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<UserModel> getCurrentUser(String accessToken) async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>(
        '/auth/me',
        options: Options(
          headers: <String, dynamic>{'Authorization': 'Bearer $accessToken'},
          extra: const <String, dynamic>{'skipRefresh': true},
        ),
      );
      final data = response.data ?? <String, dynamic>{};
      return UserModel(
        id: data['id'] as int,
        username: data['username'] as String,
        name: '${data['firstName']} ${data['lastName']}'.trim(),
        email: data['email'] as String,
        image: data['image'] as String?,
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<RefreshTokenResponse> refreshSession(
    RefreshTokenRequest request,
  ) async {
    try {
      final response = await apiClient.dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: request.toJson(),
        options: Options(
          extra: const <String, dynamic>{'skipAuth': true, 'skipRefresh': true},
        ),
      );
      return RefreshTokenResponse.fromJson(
        response.data ?? <String, dynamic>{},
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  AppException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;
    final message = data is Map<String, dynamic>
        ? (data['message'] as String? ?? '인증 요청에 실패했습니다.')
        : '인증 요청에 실패했습니다.';

    if (statusCode == 400) {
      return ValidationException(message);
    }
    if (statusCode == 401) {
      return UnauthorizedException(message);
    }
    if (statusCode == 403) {
      return ForbiddenException(message);
    }
    if (statusCode >= 500) {
      return ServerException(message, statusCode: statusCode);
    }
    return NetworkException(message);
  }
}
