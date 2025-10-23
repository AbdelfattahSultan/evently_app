import 'package:evently_app/common/SharedPreferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode _themeMode;

  late AppSharedPreferences appSharedPreferences;

  ThemeProvider() {
    appSharedPreferences = AppSharedPreferences.getInstance();
    _themeMode = appSharedPreferences.getThemeMode();
  }

  List<ThemeMode> modes() {
    return [ThemeMode.dark, ThemeMode.light];
  }

  void changeMode(ThemeMode newMode) {
    _themeMode = newMode;
    appSharedPreferences.saveThemeMode(_themeMode);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    return _themeMode;
  }

  bool isDarkMode() {
    if (_themeMode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
