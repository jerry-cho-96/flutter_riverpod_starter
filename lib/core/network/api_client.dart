import 'package:dio/dio.dart';

/// Dio를 직접 여기저기 흩뿌리지 않고,
/// "GET 한 번 하면 어떤 자료형이 돌아오는지"를 공통으로 감싸는 얇은 래퍼다.
///
/// Flutter를 처음 보는 개발자는 우선
/// "화면 -> provider -> repository -> datasource -> apiClient"
/// 흐름으로 읽으면 이해가 가장 빠르다.
class ApiClient {
  const ApiClient(this.dio);

  final Dio dio;

  /// 단건 조회에 사용한다.
  /// 예: `/posts/1` -> `{ ... }`
  Future<Map<String, dynamic>> getMap(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }

  /// 목록 조회에 사용한다.
  /// 예: `/posts?_start=0&_limit=10` -> `[ { ... }, { ... } ]`
  Future<List<Map<String, dynamic>>> getList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<List<dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    final data = response.data ?? <dynamic>[];
    return data.map((item) => Map<String, dynamic>.from(item as Map)).toList();
  }

  Future<Map<String, dynamic>> postMap(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }

  Future<Map<String, dynamic>> putMap(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }

  Future<Map<String, dynamic>> patchMap(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.patch<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }

  Future<Map<String, dynamic>> deleteMap(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }
}
