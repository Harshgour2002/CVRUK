import 'package:flutter/material.dart';

/// Defines both Light and Dark color palettes.
class AppColors {
  // ---------------------- 🌞 LIGHT THEME ----------------------
  static const lightBackground = Color(0xFFF9FAFB);
  static const lightForeground = Color(0xFF0F172A);

  static const lightPrimary = Color(0xFF3B82F6);
  static const lightPrimaryForeground = Color(0xFFFFFFFF);

  static const lightSecondary = Color(0xFFE2E8F0);
  static const lightSecondaryForeground = Color(0xFF0F172A);

  static const lightAccent = Color(0xFF60A5FA);
  static const lightAccentForeground = Color(0xFF0F172A);

  // ---------------------- 🌚 DARK THEME ----------------------
  static const darkBackground = Color(0xFF0A0F1A); // hsl(222.2, 84%, 4.9%)
  static const darkForeground = Color(0xFFFAFAFA); // hsl(210, 20%, 98%)

  static const darkPrimary = Color(0xFF3B82F6); // hsl(217.2, 91.2%, 59.8%)
  static const darkPrimaryForeground = Color(0xFF191919); // hsl(222.2, 47.4%, 11.2%)

  static const darkSecondary = Color(0xFF1E293B); // hsl(217.2, 32.6%, 17.5%)
  static const darkSecondaryForeground = Color(0xFFFAFAFA); // hsl(210, 20%, 98%)

  static const darkAccent = Color(0xFF334155); // hsl(217.2, 32.6%, 17.5%)
  static const darkAccentForeground = Color(0xFFFAFAFA); // hsl(210, 20%, 98%)
}
