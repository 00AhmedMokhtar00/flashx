part of 'manager.dart';

class SharedPreferenceUtils {

  static Future<SharedPreferences> get getSharePref async =>
      await SharedPreferences.getInstance();


  static Future<bool> clearData() async =>
      (await getSharePref).clear();

  static Future<bool> setString(String key, String data) async =>
      (await getSharePref).setString(key, data);

  static Future<bool> setBool(String key, bool data) async =>
      (await getSharePref).setBool(key, data);

  static Future<bool> setInt(String key, int data) async =>
      (await getSharePref).setInt(key, data);

  static Future<bool> setDouble(String key, double data) async =>
      (await getSharePref).setDouble(key, data);

  static Future<String> getString(String key) async =>
      (await getSharePref).getString(key)?? "";

  static Future<bool> getBool(String key) async =>
      (await getSharePref).getBool(key)?? false;

  static Future<int> getInt(String key) async =>
      (await getSharePref).getInt(key)?? 0;

  static Future<double> getDouble(String key) async =>
      (await getSharePref).getDouble(key)?? 0.0;
}