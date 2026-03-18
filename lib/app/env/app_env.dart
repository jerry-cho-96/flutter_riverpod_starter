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

  factory AppEnv.fromFlavor(AppFlavor flavor) {
    switch (flavor) {
      case AppFlavor.dev:
        return const AppEnv(
          flavor: AppFlavor.dev,
          baseUrl: 'https://dummyjson.com',
          apiMode: ApiMode.live,
          enableVerboseLogs: true,
        );
      case AppFlavor.staging:
        return const AppEnv(
          flavor: AppFlavor.staging,
          baseUrl: 'https://dummyjson.com',
          apiMode: ApiMode.live,
          enableVerboseLogs: true,
        );
      case AppFlavor.prod:
        return const AppEnv(
          flavor: AppFlavor.prod,
          baseUrl: 'https://dummyjson.com',
          apiMode: ApiMode.live,
          enableVerboseLogs: false,
        );
    }
  }
}

@Riverpod(keepAlive: true)
AppEnv appEnv(Ref ref) {
  return AppEnv.fromFlavor(AppFlavor.dev);
}
