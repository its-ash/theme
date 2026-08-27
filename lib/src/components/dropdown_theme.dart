import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppDropdownTheme {
  AppDropdownTheme._();

  static const double menuElevation = 8;

  static TextStyle textStyle(ColorScheme scheme) =>
      TextStyle(color: scheme.onSurface, fontSize: 16);

  static InputDecorationTheme inputDecorationTheme(ColorScheme scheme) =>
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      );

  static MenuStyle menuStyle(Color backgroundColor, AppShadowTheme shadows) {
    return MenuStyle(
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevation: const WidgetStatePropertyAll<double>(menuElevation),
      shadowColor: WidgetStatePropertyAll(shadows.shadowOne.color),
    );
  }

  static DropdownMenuThemeData theme(ColorScheme scheme, AppShadowTheme shadows) =>
      DropdownMenuThemeData(
        textStyle: textStyle(scheme),
        inputDecorationTheme: inputDecorationTheme(scheme),
        menuStyle: menuStyle(scheme.surface, shadows),
      );
}
