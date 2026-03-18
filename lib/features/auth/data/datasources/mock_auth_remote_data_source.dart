import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/refresh_token_response.dart';
import 'package:riverpod3_starter/features/auth/data/models/sign_in_request.dart';
import 'package:riverpod3_starter/features/auth/data/models/user_model.dart';

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  const MockAuthRemoteDataSource();

  @override
  Future<AuthSessionModel> signIn(SignInRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    if (request.username != 'emilys' || request.password != 'emilyspass') {
      throw const UnauthorizedException('아이디 또는 비밀번호가 올바르지 않습니다.');
    }

    final raw = await rootBundle.loadString('assets/mocks/profile.json');
    final profile = jsonDecode(raw) as Map<String, dynamic>;
    return AuthSessionModel.fromJson(<String, dynamic>{
      'accessToken': 'mock-token',
      'refreshToken': 'mock-refresh-token',
      'user': <String, dynamic>{
        'id': 1,
        'username': 'emilys',
        'name': profile['name'],
        'email': profile['email'],
        'image': null,
      },
    });
  }

  @override
  Future<UserModel> getCurrentUser(String accessToken) async {
    final raw = await rootBundle.loadString('assets/mocks/profile.json');
    final profile = jsonDecode(raw) as Map<String, dynamic>;
    return UserModel.fromJson(<String, dynamic>{
      'id': 1,
      'username': 'emilys',
      'name': profile['name'],
      'email': profile['email'],
      'image': null,
    });
  }

  @override
  Future<RefreshTokenResponse> refreshSession(
    RefreshTokenRequest request,
  ) async {
    return const RefreshTokenResponse(
      accessToken: 'mock-token',
      refreshToken: 'mock-refresh-token',
    );
  }
}
