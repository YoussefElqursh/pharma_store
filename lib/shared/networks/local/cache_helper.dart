import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Insert string data into the cache
  static Future<bool> insertToCache({required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  // Get data from the cache
  static String? getFromCache({required String key}) {
    return sharedPreferences.getString(key);
  }

  // Delete string data from the cache
  static Future<bool> deleteFromCache({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // Remove a specific key from the cache
  static Future<bool> removeFromCache({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // Clear all data from the cache
  static Future<bool> clearCache() async {
    return await sharedPreferences.clear();
  }
}
