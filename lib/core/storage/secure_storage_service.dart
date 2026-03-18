import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  const SecureStorageService(this.storage);

  final FlutterSecureStorage storage;

  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    await storage.write(key: key, value: jsonEncode(value));
  }

  Future<Map<String, dynamic>?> readJson(String key) async {
    final raw = await storage.read(key: key);
    if (raw == null) {
      return null;
    }
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> delete(String key) => storage.delete(key: key);
}
