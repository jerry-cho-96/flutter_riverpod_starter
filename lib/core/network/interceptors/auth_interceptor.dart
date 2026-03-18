import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.dio,
    required this.readSession,
    required this.writeSession,
    required this.clearSession,
  });

  final Dio dio;
  final Future<Map<String, dynamic>?> Function() readSession;
  final Future<void> Function(Map<String, dynamic> session) writeSession;
  final Future<void> Function() clearSession;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra['skipAuth'] == true) {
      handler.next(options);
      return;
    }

    final session = await readSession();
    final token = session?['accessToken'] as String?;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final request = err.requestOptions;

    if (statusCode != 401 || request.extra['skipRefresh'] == true) {
      handler.next(err);
      return;
    }

    final session = await readSession();
    final refreshToken = session?['refreshToken'] as String?;
    if (refreshToken == null || refreshToken.isEmpty) {
      await clearSession();
      handler.next(err);
      return;
    }

    try {
      final refreshResponse = await dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: <String, dynamic>{
          'refreshToken': refreshToken,
          'expiresInMins': 30,
        },
        options: Options(
          extra: const <String, dynamic>{'skipAuth': true, 'skipRefresh': true},
        ),
      );

      final refreshed = refreshResponse.data ?? <String, dynamic>{};
      final updatedSession = <String, dynamic>{
        ...?session,
        'accessToken': refreshed['accessToken'],
        'refreshToken': refreshed['refreshToken'],
      };
      await writeSession(updatedSession);

      final retryOptions = request.copyWith(
        headers: <String, dynamic>{
          ...request.headers,
          'Authorization': 'Bearer ${refreshed['accessToken']}',
        },
        extra: <String, dynamic>{...request.extra, 'skipRefresh': true},
      );

      final response = await dio.fetch<dynamic>(retryOptions);
      handler.resolve(response);
    } on DioException catch (_) {
      await clearSession();
      handler.next(err);
    }
  }
}
