import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class ThemeController extends ValueNotifier<ThemeControllerState> {
  ThemeController()
      : super(const ThemeControllerState(
          mode: ThemeMode.system,
          styleId: 'light',
        ));

  void toggle() {
    value = value.copyWith(
      mode: value.mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
  }

  void setMode(ThemeMode mode) => value = value.copyWith(mode: mode);

  void setStyle(String styleId) => value = value.copyWith(styleId: styleId);

  AppThemeStyle get style => AppThemeStyle.byId(value.styleId);
}

class ThemeControllerState {
  const ThemeControllerState({required this.mode, required this.styleId});

  final ThemeMode mode;
  final String styleId;

  ThemeControllerState copyWith({ThemeMode? mode, String? styleId}) =>
      ThemeControllerState(
        mode: mode ?? this.mode,
        styleId: styleId ?? this.styleId,
      );
}
