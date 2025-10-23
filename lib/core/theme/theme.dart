import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // LIGHT THEME
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.gray,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.inter(color: AppColors.gray, fontSize: 16),
      prefixIconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 28),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
  );

  // DARK THEME
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkPrimary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.gray,
      surface: AppColors.darkPrimary,
      onPrimary: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.white60,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.inter(color: Colors.white70, fontSize: 16),
      prefixIconColor: Colors.white70,
      suffixIconColor: Colors.white70,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.white70, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPrimary,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.white60,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 28),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
  );
}
