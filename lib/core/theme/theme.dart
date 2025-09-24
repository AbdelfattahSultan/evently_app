import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(primary: AppColors.primary),
  );

  static final darkTheme = ThemeData();
}
