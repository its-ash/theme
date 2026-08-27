import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppButtonThemes {
  AppButtonThemes._();

  static ElevatedButtonThemeData elevatedButtonTheme(
    ColorScheme scheme,
    AppShadowTheme shadows,
  ) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: scheme.onPrimary,
      backgroundColor: scheme.primary,
      disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
      disabledBackgroundColor: scheme.onSurface.withValues(alpha: 0.12),
      shadowColor: shadows.shadowOne.color,
      elevation: 2,
      minimumSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static FilledButtonThemeData filledButtonTheme(
    ColorScheme scheme,
    AppShadowTheme shadows,
  ) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: scheme.onPrimary,
      backgroundColor: scheme.primary,
      disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
      disabledBackgroundColor: scheme.onSurface.withValues(alpha: 0.12),
      shadowColor: shadows.shadowOne.color,
      elevation: 2,
      minimumSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme scheme) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size.fromHeight(48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static TextButtonThemeData textButtonTheme(ColorScheme scheme) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );

  static FloatingActionButtonThemeData floatingActionButtonTheme(
    ColorScheme scheme,
  ) => FloatingActionButtonThemeData(
    backgroundColor: scheme.primary,
    foregroundColor: scheme.onPrimary,
    elevation: 6,
    shape: const CircleBorder(),
  );

  static IconButtonThemeData iconButtonTheme(ColorScheme scheme) =>
      IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
}
