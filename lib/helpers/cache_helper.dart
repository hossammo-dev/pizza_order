import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> save(
      {required String key, required dynamic value}) async {
    if (value is String) return await _prefs!.setString(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);

    return await _prefs!.setDouble(key, value);
  }

  static dynamic get(String key) => _prefs!.get(key);

  static Future<bool> remove(String key) async => await _prefs!.remove(key);
}
