import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppNavigationTheme {
  AppNavigationTheme._();

  static WidgetStateProperty<TextStyle> _navLabelStyle(
    TextStyle base,
    Color active,
    Color inactive,
  ) => WidgetStateProperty.resolveWith<TextStyle>((states) {
    final color = states.contains(WidgetState.selected) ? active : inactive;
    return base.copyWith(color: color);
  });

  static WidgetStateProperty<IconThemeData> _navIconTheme(Color active, Color inactive) =>
      WidgetStateProperty.resolveWith<IconThemeData>((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected) ? active : inactive,
        );
      });

  static NavigationBarThemeData navigationBarTheme(ColorScheme scheme, TextTheme textTheme) =>
      NavigationBarThemeData(
        backgroundColor: scheme.surface,
        elevation: 2,
        height: 80,
        indicatorColor: scheme.primary.withValues(alpha: 0.16),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: _navLabelStyle(
          textTheme.labelLarge ?? const TextStyle(),
          scheme.onSurface,
          scheme.onSurface.withValues(alpha: 0.6),
        ),
        iconTheme: _navIconTheme(scheme.primary, scheme.onSurface.withValues(alpha: 0.6)),
      );

  static NavigationRailThemeData navigationRailTheme(ColorScheme scheme, TextTheme textTheme) =>
      NavigationRailThemeData(
        backgroundColor: scheme.surface,
        selectedIconTheme: IconThemeData(color: scheme.primary),
        unselectedIconTheme: IconThemeData(color: scheme.onSurface.withValues(alpha: 0.6)),
        selectedLabelTextStyle: (textTheme.labelLarge ?? const TextStyle()).copyWith(
          color: scheme.primary,
        ),
        unselectedLabelTextStyle: (textTheme.labelLarge ?? const TextStyle()).copyWith(
          color: scheme.onSurface.withValues(alpha: 0.6),
        ),
        useIndicator: true,
        indicatorColor: scheme.primary.withValues(alpha: 0.16),
        minWidth: 80,
      );

  static NavigationDrawerThemeData navigationDrawerTheme(
    ColorScheme scheme,
    TextTheme textTheme,
  ) => NavigationDrawerThemeData(
    backgroundColor: scheme.surface,
    indicatorColor: scheme.primary.withValues(alpha: 0.16),
    indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    labelTextStyle: WidgetStatePropertyAll(
      (textTheme.bodyLarge ?? const TextStyle()).copyWith(color: scheme.onSurface),
    ),
    iconTheme: WidgetStatePropertyAll(IconThemeData(color: scheme.onSurface)),
  );

  static BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme scheme) =>
      BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurface.withValues(alpha: 0.6),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      );

  static DrawerThemeData drawerTheme(ColorScheme scheme, AppShadowTheme shadows) =>
      DrawerThemeData(
        backgroundColor: scheme.surface,
        elevation: 1,
        shadowColor: shadows.shadowOne.color,
        width: 304,
      );
}
