import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData theme(AppShadowTheme shadows) => CardThemeData(
    elevation: 2,
    shadowColor: shadows.shadowOne.color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
