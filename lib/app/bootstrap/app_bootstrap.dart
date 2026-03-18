import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:riverpod3_starter/app/bootstrap/app_provider_observer.dart';
import 'package:riverpod3_starter/app/bootstrap/app_retry.dart';
import 'package:riverpod3_starter/app/di/secure_storage_provider.dart';
import 'package:riverpod3_starter/app/di/shared_preferences_provider.dart';
import 'package:riverpod3_starter/app/env/app_env.dart';

Future<void> bootstrap({required AppEnv env, required Widget child}) async {
  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      retry: appRetry,
      overrides: [
        appEnvProvider.overrideWithValue(env),
        sharedPreferencesProvider.overrideWithValue(prefs),
        secureStorageProvider.overrideWithValue(secureStorage),
      ],
      child: child,
    ),
  );
}
