import 'package:shared_preferences/shared_preferences.dart';

class SettingsDataSource {
  static const String keyNotificationsEnabled = 'notifications_enabled';
  static const String keyDarkThemeEnabled = 'dark_theme_enabled';
  static const String keySelectedLanguage = 'selected_language';

  Future<bool> getNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyNotificationsEnabled) ?? true;
  }

  Future<bool> setNotificationsEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyNotificationsEnabled, value);
  }

  Future<bool> getDarkThemeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyDarkThemeEnabled) ?? false;
  }

  Future<bool> setDarkThemeEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyDarkThemeEnabled, value);
  }

  Future<String> getSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keySelectedLanguage) ?? 'Русский';
  }

  Future<bool> setSelectedLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keySelectedLanguage, language);
  }
}
