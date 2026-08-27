import 'package:flutter/material.dart';

class AppSelectionThemes {
  AppSelectionThemes._();

  static WidgetStateProperty<Color?> _fillColor(Color active, Color onSurface) =>
      WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) return onSurface.withValues(alpha: 0.38);
        if (states.contains(WidgetState.selected)) return active;
        return onSurface.withValues(alpha: 0.6);
      });

  static CheckboxThemeData checkboxTheme(ColorScheme scheme) => CheckboxThemeData(
    fillColor: _fillColor(scheme.primary, scheme.onSurface),
    checkColor: WidgetStatePropertyAll(scheme.onPrimary),
    side: BorderSide(color: scheme.outline, width: 1.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    splashRadius: 20,
  );

  static RadioThemeData radioTheme(ColorScheme scheme) => RadioThemeData(
    fillColor: _fillColor(scheme.primary, scheme.onSurface),
    splashRadius: 20,
  );

  static WidgetStateProperty<Color?> _switchTrackOutline(Color border) =>
      WidgetStateProperty.resolveWith<Color?>((states) {
        return states.contains(WidgetState.selected) ? Colors.transparent : border;
      });

  static SwitchThemeData switchTheme(ColorScheme scheme) => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return scheme.onSurface.withValues(alpha: 0.38);
      }
      return states.contains(WidgetState.selected) ? scheme.onPrimary : scheme.surface;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return scheme.onSurface.withValues(alpha: 0.12);
      }
      return states.contains(WidgetState.selected)
          ? scheme.primary
          : scheme.onSurface.withValues(alpha: 0.3);
    }),
    trackOutlineColor: _switchTrackOutline(scheme.outline),
  );

  static SliderThemeData sliderTheme(ColorScheme scheme) => SliderThemeData(
    trackHeight: 4,
    activeTrackColor: scheme.primary,
    inactiveTrackColor: scheme.primary.withValues(alpha: 0.24),
    thumbColor: scheme.primary,
    overlayColor: scheme.primary.withValues(alpha: 0.12),
    valueIndicatorColor: scheme.primary,
    valueIndicatorTextStyle: TextStyle(color: scheme.onPrimary),
  );
}
