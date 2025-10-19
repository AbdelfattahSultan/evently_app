import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String themeKey = "themeKey";
  static const String light = "light";
  static const String dark = "dark";
  static const String onboarding = "onboardingKey";



  late SharedPreferences _sharedPreferences;

  AppSharedPreferences._();

  static AppSharedPreferences? _appSharedPreferences;

  static AppSharedPreferences getInstance() {
    return _appSharedPreferences!;
  }

  static Future<void> init() async {
    if (_appSharedPreferences == null) {
      _appSharedPreferences = AppSharedPreferences._();
      await _appSharedPreferences?.initialize();
    }
  }

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveThemeMode(ThemeMode newTheme) async {
    var theme = newTheme == ThemeMode.light ? light : dark;

    await _sharedPreferences.setString(themeKey, theme);
  }

  ThemeMode getThemeMode() {
    var themeName = _sharedPreferences.getString(themeKey);

    return themeName == dark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> saveLanguage(Locale local) async {
    await _sharedPreferences.setString("newLocal", local.languageCode);
  }

  Locale getLanguage() {
    var newCode = _sharedPreferences.getString("newLocal");
    return newCode == null
        ? Locale("en")
        : Locale.fromSubtags(languageCode: newCode);
  }

    Future<void> onboardingCheck(bool check) async {
    await _sharedPreferences.setBool(onboarding, check);
  }

  bool isOnboarding() {
    return _sharedPreferences.getBool(onboarding) ?? true;
  }
}
