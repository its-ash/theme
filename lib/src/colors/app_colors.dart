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
  static const Color primaryContainerLight = Color(0xFFD3E4FB);
  static const Color onPrimaryContainerLight = Color(0xFF0A2647);
  static const Color secondaryContainerLight = Color(0xFFC7F5EE);
  static const Color onSecondaryContainerLight = Color(0xFF00332D);
  static const Color errorContainerLight = Color(0xFFF9DEDC);
  static const Color onErrorContainerLight = Color(0xFF410E0B);
  static const Color surfaceContainerLowLight = Color(0xFFF7F2FA);
  static const Color surfaceContainerLight = Color(0xFFF1ECF4);
  static const Color surfaceContainerHighLight = Color(0xFFEBE6EE);
  static const Color inverseSurfaceLight = Color(0xFF313033);
  static const Color onInverseSurfaceLight = Color(0xFFF4EFF4);

  static const Color primaryDark = Color(0xFF90CAF9);
  static const Color secondaryDark = Color(0xFF03DAC6);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color errorDark = Color(0xFFCF6679);
  static const Color onPrimaryDark = Color(0xFF000000);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color borderDark = Color(0xFF49454F);
  static const Color primaryContainerDark = Color(0xFF0D4B8C);
  static const Color onPrimaryContainerDark = Color(0xFFD3E4FB);
  static const Color secondaryContainerDark = Color(0xFF00504A);
  static const Color onSecondaryContainerDark = Color(0xFFC7F5EE);
  static const Color errorContainerDark = Color(0xFF8C1D18);
  static const Color onErrorContainerDark = Color(0xFFF9DEDC);
  static const Color surfaceContainerLowDark = Color(0xFF1D1B1E);
  static const Color surfaceContainerDark = Color(0xFF211F22);
  static const Color surfaceContainerHighDark = Color(0xFF2B292D);
  static const Color inverseSurfaceDark = Color(0xFFE6E1E5);
  static const Color onInverseSurfaceDark = Color(0xFF313033);

  static ColorScheme get lightColorScheme => const ColorScheme.light(
    primary: primaryLight,
    onPrimary: onPrimaryLight,
    primaryContainer: primaryContainerLight,
    onPrimaryContainer: onPrimaryContainerLight,
    secondary: secondaryLight,
    onSecondary: onPrimaryLight,
    secondaryContainer: secondaryContainerLight,
    onSecondaryContainer: onSecondaryContainerLight,
    surface: surfaceLight,
    onSurface: onSurfaceLight,
    surfaceContainerLow: surfaceContainerLowLight,
    surfaceContainer: surfaceContainerLight,
    surfaceContainerHigh: surfaceContainerHighLight,
    inverseSurface: inverseSurfaceLight,
    onInverseSurface: onInverseSurfaceLight,
    error: errorLight,
    onError: onPrimaryLight,
    errorContainer: errorContainerLight,
    onErrorContainer: onErrorContainerLight,
    outline: borderLight,
  );

  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    primaryContainer: primaryContainerDark,
    onPrimaryContainer: onPrimaryContainerDark,
    secondary: secondaryDark,
    onSecondary: onPrimaryDark,
    secondaryContainer: secondaryContainerDark,
    onSecondaryContainer: onSecondaryContainerDark,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    surfaceContainerLow: surfaceContainerLowDark,
    surfaceContainer: surfaceContainerDark,
    surfaceContainerHigh: surfaceContainerHighDark,
    inverseSurface: inverseSurfaceDark,
    onInverseSurface: onInverseSurfaceDark,
    error: errorDark,
    onError: onPrimaryDark,
    errorContainer: errorContainerDark,
    onErrorContainer: onErrorContainerDark,
    outline: borderDark,
  );
}
