import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyDarkMode = 'darkMode';
  static const String _keyLanguage = 'language';
  static const String _keyNotifications = 'notifications';

  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> setDarkMode(bool isDark) async {
    final prefs = await _getPrefs();
    await prefs.setBool(_keyDarkMode, isDark);
  }

  static Future<bool> getDarkMode() async {
    final prefs = await _getPrefs();
    return prefs.getBool(_keyDarkMode) ?? false;
  }

  static Future<void> setLanguage(String languageCode) async {
    final prefs = await _getPrefs();
    await prefs.setString(_keyLanguage, languageCode);
}

  static Future<String> getLanguage() async {
    final prefs = await _getPrefs();
    return prefs.getString(_keyLanguage) ?? 'en';
  }

  static Future<void> setNotifications(bool enabled) async {
    final prefs = await _getPrefs();
    await prefs.setBool(_keyNotifications, enabled);
  }

  static Future<bool> getNotifications() async {
    final prefs = await _getPrefs();
    return prefs.getBool(_keyNotifications) ?? true;
  }
}
