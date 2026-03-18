import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/di/secure_storage_provider.dart';
import 'package:riverpod3_starter/core/constants/storage_keys.dart';
import 'package:riverpod3_starter/core/storage/secure_storage_service.dart';
import 'package:riverpod3_starter/features/auth/data/models/auth_session_model.dart';

part 'auth_local_data_source.g.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this.storageService);

  final SecureStorageService storageService;

  Future<AuthSessionModel?> restoreSession() async {
    final json = await storageService.readJson(StorageKeys.authSession);
    if (json == null) {
      return null;
    }
    return AuthSessionModel.fromJson(json);
  }

  Future<void> persistSession(AuthSessionModel session) {
    return storageService.writeJson(StorageKeys.authSession, session.toJson());
  }

  Future<void> clear() => storageService.delete(StorageKeys.authSession);
}

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  final storage = ref.watch(secureStorageProvider);
  return AuthLocalDataSource(SecureStorageService(storage));
}
