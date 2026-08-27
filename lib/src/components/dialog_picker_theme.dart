import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppDialogTheme {
  AppDialogTheme._();

  static DialogThemeData theme(
    ColorScheme scheme,
    TextTheme textTheme,
    AppShadowTheme shadows,
  ) => DialogThemeData(
    backgroundColor: scheme.surface,
    elevation: 3,
    shadowColor: shadows.shadowTwo.color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    titleTextStyle: (textTheme.headlineSmall ?? const TextStyle()).copyWith(
      color: scheme.onSurface,
    ),
    contentTextStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(
      color: scheme.onSurface,
    ),
    insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
  );

  static WidgetStateProperty<Color?> _dayForeground(Color onPrimary, Color onSurface) =>
      WidgetStateProperty.resolveWith<Color?>((states) {
        return states.contains(WidgetState.selected) ? onPrimary : onSurface;
      });

  static WidgetStateProperty<Color?> _dayBackground(Color primary) =>
      WidgetStateProperty.resolveWith<Color?>((states) {
        return states.contains(WidgetState.selected) ? primary : Colors.transparent;
      });

  static DatePickerThemeData datePickerTheme(ColorScheme scheme) => DatePickerThemeData(
    backgroundColor: scheme.surface,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    headerBackgroundColor: scheme.primary,
    headerForegroundColor: scheme.onPrimary,
    dayForegroundColor: _dayForeground(scheme.onPrimary, scheme.onSurface),
    dayBackgroundColor: _dayBackground(scheme.primary),
    todayForegroundColor: WidgetStatePropertyAll(scheme.primary),
    todayBorder: BorderSide(color: scheme.primary),
  );

  static TimePickerThemeData timePickerTheme(ColorScheme scheme) => TimePickerThemeData(
    backgroundColor: scheme.surface,
    dialBackgroundColor: scheme.onSurface.withValues(alpha: 0.08),
    dialHandColor: scheme.primary,
    hourMinuteColor: scheme.primary.withValues(alpha: 0.12),
    hourMinuteTextColor: scheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );
}
