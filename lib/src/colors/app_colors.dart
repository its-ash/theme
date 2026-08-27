import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xFF1976D2);
  static const Color secondaryLight = Color(0xFF03DAC6);
  static const Color surfaceLight = Color(0xFFFFFBFE);
  static const Color errorLight = Color(0xFFB00020);
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onSurfaceLight = Color(0xFF1C1B1F);
  static const Color borderLight = Color(0xFFE0E0E0);

  static const Color primaryDark = Color(0xFF90CAF9);
  static const Color secondaryDark = Color(0xFF03DAC6);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color errorDark = Color(0xFFCF6679);
  static const Color onPrimaryDark = Color(0xFF000000);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color borderDark = Color(0xFF49454F);

  static ColorScheme get lightColorScheme => const ColorScheme.light(
    primary: primaryLight,
    onPrimary: onPrimaryLight,
    secondary: secondaryLight,
    onSecondary: onPrimaryLight,
    surface: surfaceLight,
    onSurface: onSurfaceLight,
    error: errorLight,
    onError: onPrimaryLight,
    outline: borderLight,
  );

  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    secondary: secondaryDark,
    onSecondary: onPrimaryDark,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    error: errorDark,
    onError: onPrimaryDark,
    outline: borderDark,
  );
}
