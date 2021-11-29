
import 'package:flashx/domain/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'utils.dart';
part 'keys.dart';

class LocalDatabaseManager{
  static bool currentTheme = false;
  static late Launch nextLaunch;
  static late List<Payload> payloads;
  static late List<Launch> pastLaunches;
  static Future<void> initialLocalDatabase() async {

    currentTheme   = await getTheme();
  }

  static Future<void> setTheme(bool value) async {
    SharedPreferenceUtils.setBool(SharedPreferenceKeys.CURRENT_THEME_STATUS, value);
  }

  static Future<bool> getTheme() async {
    return SharedPreferenceUtils.getBool(SharedPreferenceKeys.CURRENT_THEME_STATUS);
  }

}