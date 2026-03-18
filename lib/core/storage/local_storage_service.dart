import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  const LocalStorageService(this.preferences);

  final SharedPreferences preferences;

  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    await preferences.setString(key, jsonEncode(value));
  }

  Map<String, dynamic>? readJson(String key) {
    final raw = preferences.getString(key);
    if (raw == null) {
      return null;
    }
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> delete(String key) => preferences.remove(key);
}
