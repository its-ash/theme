import 'package:flutter/material.dart';

import 'package:theme/src/colors/app_colors.dart';
import 'package:theme/src/shadows/app_shadow_theme.dart';
import 'package:theme/src/theme_presets/app_theme_preset.dart';

class DarkPresets {
  DarkPresets._();

  static final default_ = AppThemePreset(
    id: 'default',
    name: 'Default Dark',
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    shadows: const AppShadowTheme.dark(),
  );

  static const darkHighContrast = AppThemePreset(
    id: 'dark-highcontrast',
    name: 'Dark High Contrast',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFFFFD700),
      onPrimary: Color(0xFF000000),
      secondary: Color(0xFF00E5FF),
      surface: Color(0xFF000000),
      onSurface: Color(0xFFFFFFFF),
      outline: Color(0xFFFFFFFF),
    ),
    shadows: AppShadowTheme(
      hairline: BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 0, offset: Offset(0, 1)),
      shadowOne: BoxShadow(color: Color(0xFF000000), blurRadius: 4, offset: Offset(0, 2)),
      shadowTwo: BoxShadow(color: Color(0xFF000000), blurRadius: 8, offset: Offset(0, 4)),
      shadowThree: BoxShadow(color: Color(0xFF000000), blurRadius: 14, offset: Offset(0, 8)),
    ),
    cardRadius: 4,
    buttonRadius: 4,
    inputRadius: 4,
    dialogRadius: 4,
  );

  static final all = <AppThemePreset>[
    default_,
    darkHighContrast,
  ];

  static AppThemePreset byId(String id) =>
      all.firstWhere((p) => p.id == id, orElse: () => default_);
}