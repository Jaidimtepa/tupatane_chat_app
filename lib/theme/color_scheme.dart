import 'package:flutter/material.dart';

/// Tupatane App Color Scheme (Green & Teal)
/// Fresh & Calming - Like WhatsApp
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF25D366); // Green
  static const Color secondary = Color(0xFF34B7F1); // Blue
  static const Color accent = Color(0xFF128C7E); // Teal

  // Background & Surfaces
  static const Color surfaceDark = Color(0xFF0D1418); // Dark background
  static const Color surfaceLight = Color(
    0xFF0F172A,
  ); // Slightly lighter surface
  static const Color surfaceCard = Color(0xFF1A1F2E); // Card background

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFF8A8A8E); // Gray text
  static const Color textTertiary = Color(0xFF5E5E63); // Darker gray text

  // System Colors
  static const Color success = Color(0xFF25D366); // Green (same as primary)
  static const Color error = Color(0xFFFF3B30); // Red
  static const Color warning = Color(0xFFFF9500); // Orange
  static const Color info = Color(0xFF34B7F1); // Blue (same as secondary)

  // Additional Colors
  static const Color divider = Color(0xFF3A3F47); // Divider color
  static const Color border = Color(0xFF4A5059); // Border color
  static const Color shadow = Color(0xFF000000); // Shadow color
  static const Color disabled = Color(0xFF555555); // Disabled state
}

/// Light Theme Color Scheme
ColorScheme getLightColorScheme() {
  return ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: Colors.white,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onTertiary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
  );
}

/// Dark Theme Color Scheme
ColorScheme getDarkColorScheme() {
  return ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: AppColors.surfaceDark,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onTertiary: Colors.white,
    onSurface: AppColors.textPrimary,
    onError: Colors.white,
  );
}

/// Light Theme Data
ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: getLightColorScheme(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.accent, width: 2),
      ),
      hintStyle: const TextStyle(color: AppColors.textSecondary),
    ),
  );
}

/// Dark Theme Data
ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: getDarkColorScheme(),
    scaffoldBackgroundColor: AppColors.surfaceDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.accent, width: 2),
      ),
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      labelStyle: const TextStyle(color: AppColors.textPrimary),
    ),
  );
}
