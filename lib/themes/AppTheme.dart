import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <--- 1. IMPORT THIS
import 'AppColors.dart';

class AppTheme {
  // 🌞 Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.lightPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
        elevation: 0,

        // This makes Status Bar icons BLACK (for white/light backgrounds)
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Android: Black Icons
          statusBarBrightness: Brightness.light,    // iOS: Black Icons
        ),
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.lightForeground),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }

  // 🌚 Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.darkPrimary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSecondary,
        foregroundColor: AppColors.darkForeground,
        elevation: 0,

        // This makes Status Bar icons WHITE (for dark backgrounds)
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Android: White Icons
          statusBarBrightness: Brightness.dark,      // iOS: White Icons`
        ),
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.darkForeground),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkPrimaryForeground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}