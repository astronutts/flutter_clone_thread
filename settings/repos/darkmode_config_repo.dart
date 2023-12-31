import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeConfigRepository {
  static const String _darkmode = 'darkmode';
  SharedPreferences _preferences;

  DarkmodeConfigRepository(this._preferences);

  Future<void> setDarkmode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarkmode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
