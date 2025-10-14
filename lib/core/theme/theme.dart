import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(primary: AppColors.primary),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.jockeyOne(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.jockeyOne(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: GoogleFonts.inter(color: AppColors.gray, fontSize: 16),
      prefixIconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 2),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimary,
    colorScheme: ColorScheme.light(primary: AppColors.primary),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.jockeyOne(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.jockeyOne(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.jockeyOne(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.primary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      centerTitle: true,
    ),
  );
}
