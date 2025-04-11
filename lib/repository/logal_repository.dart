import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  static Future<void> setBool(String key, bool value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool?> getBool(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setString(String key, String value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getString(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setInt(String key, int value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<int?> getInt(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt(key);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setDouble(String key, double value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<double?> getDouble(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(key);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setStringList(String key, List<String> value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(key, value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>?> getStringList(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(key);
    } catch (e) {
      rethrow;
    }
  }
}
