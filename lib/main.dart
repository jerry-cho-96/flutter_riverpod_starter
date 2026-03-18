import 'package:flutter/widgets.dart';

import 'package:riverpod3_starter/app/app.dart';
import 'package:riverpod3_starter/app/bootstrap/app_bootstrap.dart';
import 'package:riverpod3_starter/app/env/app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(env: AppEnv.fromDefines(), child: const App());
}
