import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/env/app_flavor.dart';

part 'app_env.g.dart';

enum ApiMode { mock, live }

class AppEnv {
  const AppEnv({
    required this.flavor,
    required this.baseUrl,
    required this.apiMode,
    required this.enableVerboseLogs,
  });

  final AppFlavor flavor;
  final String baseUrl;
  final ApiMode apiMode;
  final bool enableVerboseLogs;

  factory AppEnv.fromFlavor(
    AppFlavor flavor, {
    String? baseUrl,
    ApiMode? apiMode,
    bool? enableVerboseLogs,
  }) {
    final defaults = switch (flavor) {
      AppFlavor.dev => const AppEnv(
        flavor: AppFlavor.dev,
        baseUrl: 'https://dummyjson.com',
        apiMode: ApiMode.live,
        enableVerboseLogs: true,
      ),
      AppFlavor.staging => const AppEnv(
        flavor: AppFlavor.staging,
        baseUrl: 'https://dummyjson.com',
        apiMode: ApiMode.live,
        enableVerboseLogs: true,
      ),
      AppFlavor.prod => const AppEnv(
        flavor: AppFlavor.prod,
        baseUrl: 'https://dummyjson.com',
        apiMode: ApiMode.live,
        enableVerboseLogs: false,
      ),
    };

    return AppEnv(
      flavor: defaults.flavor,
      baseUrl: baseUrl ?? defaults.baseUrl,
      apiMode: apiMode ?? defaults.apiMode,
      enableVerboseLogs: enableVerboseLogs ?? defaults.enableVerboseLogs,
    );
  }

  factory AppEnv.fromDefines() {
    final flavor = parseAppFlavor(const String.fromEnvironment('APP_FLAVOR'));
    final rawBaseUrl = const String.fromEnvironment('BASE_URL');
    final rawApiMode = const String.fromEnvironment('API_MODE');
    final rawVerboseLogs = const String.fromEnvironment('VERBOSE_LOGS');

    return AppEnv.fromFlavor(
      flavor,
      baseUrl: rawBaseUrl.isEmpty ? null : rawBaseUrl,
      apiMode: rawApiMode.isEmpty ? null : parseApiMode(rawApiMode),
      enableVerboseLogs: rawVerboseLogs.isEmpty
          ? null
          : _parseBool(rawVerboseLogs),
    );
  }
}

ApiMode parseApiMode(String value) {
  return switch (value.toLowerCase()) {
    'mock' => ApiMode.mock,
    _ => ApiMode.live,
  };
}

bool _parseBool(String value) {
  return switch (value.toLowerCase()) {
    '1' || 'true' || 'yes' || 'on' => true,
    '0' || 'false' || 'no' || 'off' => false,
    _ => false,
  };
}

@Riverpod(keepAlive: true)
AppEnv appEnv(Ref ref) {
  return AppEnv.fromDefines();
}
