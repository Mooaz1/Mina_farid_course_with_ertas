import 'package:mf_course/app/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";

class PreferancesManager {
  final SharedPreferences _preferences;

  PreferancesManager(this._preferences);

  Future<String> getLanguage() async {
    final language = _preferences.getString(prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    }else{
      return LanguageType.english.getValue();
    }
  }
}
