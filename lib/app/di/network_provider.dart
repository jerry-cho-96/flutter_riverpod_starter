import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/env/app_env.dart';
import 'package:riverpod3_starter/app/di/secure_storage_provider.dart';
import 'package:riverpod3_starter/core/constants/storage_keys.dart';
import 'package:riverpod3_starter/core/network/api_client.dart';
import 'package:riverpod3_starter/core/network/interceptors/auth_interceptor.dart';
import 'package:riverpod3_starter/core/network/interceptors/logging_interceptor.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final env = ref.watch(appEnvProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ),
  );

  if (env.enableVerboseLogs) {
    dio.interceptors.add(ref.watch(loggingInterceptorProvider));
  }

  dio.interceptors.add(
    AuthInterceptor(
      dio: dio,
      readSession: () async {
        final raw = await ref
            .read(secureStorageProvider)
            .read(key: StorageKeys.authSession);
        if (raw == null || raw.isEmpty) {
          return null;
        }
        try {
          return jsonDecode(raw) as Map<String, dynamic>;
        } catch (_) {
          await ref
              .read(secureStorageProvider)
              .delete(key: StorageKeys.authSession);
          return null;
        }
      },
      writeSession: (session) async {
        await ref
            .read(secureStorageProvider)
            .write(key: StorageKeys.authSession, value: jsonEncode(session));
      },
      clearSession: () async {
        await ref
            .read(secureStorageProvider)
            .delete(key: StorageKeys.authSession);
      },
    ),
  );

  return dio;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient(ref.watch(dioProvider));
}
