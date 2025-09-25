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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      centerTitle: true,
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
