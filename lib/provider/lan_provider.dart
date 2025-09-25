import 'package:evently_app/common/SharedPreferences.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale _locale;

  late AppSharedPreferences appSharedPreferences;

  LanguageProvider() {
    appSharedPreferences = AppSharedPreferences.getInstance();
    _locale = appSharedPreferences.getLanguage();
  }

  List<Locale> languageList() {
    return [
      Locale("en"),
       Locale("ar")
      ];
  }

  void changeLocale(Locale newLocal) {
    _locale = newLocal;
    appSharedPreferences.saveLanguage(_locale);
    notifyListeners();
  }

  Locale getLocalLanguage() {
    return _locale;
  }
}
