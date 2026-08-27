import 'package:flutter/material.dart';

class AppFeedbackTheme {
  AppFeedbackTheme._();

  static SnackBarThemeData snackBarTheme(ColorScheme scheme, TextTheme textTheme) =>
      SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(
          color: scheme.onInverseSurface,
        ),
        actionTextColor: scheme.inversePrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 3,
      );

  static TooltipThemeData tooltipTheme(ColorScheme scheme, TextTheme textTheme) =>
      TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.onSurface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(
          color: scheme.surface,
          fontSize: 12,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        waitDuration: const Duration(milliseconds: 400),
      );

  static MaterialBannerThemeData bannerTheme(ColorScheme scheme, TextTheme textTheme) =>
      MaterialBannerThemeData(
        backgroundColor: Color.alphaBlend(
          scheme.onSurface.withValues(alpha: 0.05),
          scheme.surface,
        ),
        contentTextStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(
          color: scheme.onSurface,
        ),
        dividerColor: scheme.outline,
        padding: const EdgeInsets.all(16),
      );

  static ProgressIndicatorThemeData progressIndicatorTheme(ColorScheme scheme) =>
      ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.primary.withValues(alpha: 0.24),
        circularTrackColor: scheme.primary.withValues(alpha: 0.24),
        linearMinHeight: 4,
      );
}
