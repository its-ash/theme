import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppMenuTheme {
  AppMenuTheme._();

  static PopupMenuThemeData popupMenuTheme(
    ColorScheme scheme,
    TextTheme textTheme,
    AppShadowTheme shadows,
  ) => PopupMenuThemeData(
    color: scheme.surface,
    elevation: 3,
    shadowColor: shadows.shadowOne.color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(color: scheme.onSurface),
  );

  static MenuThemeData menuTheme(ColorScheme scheme, AppShadowTheme shadows) => MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(scheme.surface),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevation: const WidgetStatePropertyAll(8),
      shadowColor: WidgetStatePropertyAll(shadows.shadowOne.color),
    ),
  );

  static MenuBarThemeData menuBarTheme(ColorScheme scheme) => MenuBarThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(scheme.surface),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );

  static MenuButtonThemeData menuButtonTheme(ColorScheme scheme) => MenuButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(scheme.onSurface),
    ),
  );

  static SearchBarThemeData searchBarTheme(
    ColorScheme scheme,
    TextTheme textTheme,
    AppShadowTheme shadows,
  ) => SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(scheme.surface),
    elevation: const WidgetStatePropertyAll(1),
    shadowColor: WidgetStatePropertyAll(shadows.shadowOne.color),
    side: WidgetStatePropertyAll(BorderSide(color: scheme.outline)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    ),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
    textStyle: WidgetStatePropertyAll(
      (textTheme.bodyLarge ?? const TextStyle()).copyWith(color: scheme.onSurface),
    ),
    hintStyle: WidgetStatePropertyAll(
      (textTheme.bodyLarge ?? const TextStyle()).copyWith(
        color: scheme.onSurface.withValues(alpha: 0.6),
      ),
    ),
  );

  static SearchViewThemeData searchViewTheme(ColorScheme scheme, TextTheme textTheme) =>
      SearchViewThemeData(
        backgroundColor: scheme.surface,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        headerTextStyle: (textTheme.bodyLarge ?? const TextStyle()).copyWith(
          color: scheme.onSurface,
        ),
        headerHintStyle: (textTheme.bodyLarge ?? const TextStyle()).copyWith(
          color: scheme.onSurface.withValues(alpha: 0.6),
        ),
        dividerColor: scheme.outline,
      );
}
