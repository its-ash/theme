import 'package:flutter/material.dart';

class AppListTheme {
  AppListTheme._();

  static ListTileThemeData listTileTheme(ColorScheme scheme, TextTheme textTheme) =>
      ListTileThemeData(
        iconColor: scheme.onSurface.withValues(alpha: 0.6),
        textColor: scheme.onSurface,
        tileColor: Colors.transparent,
        selectedColor: scheme.primary,
        selectedTileColor: scheme.primary.withValues(alpha: 0.08),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: (textTheme.bodyLarge ?? const TextStyle()).copyWith(
          color: scheme.onSurface,
        ),
        subtitleTextStyle: (textTheme.bodyMedium ?? const TextStyle()).copyWith(
          color: scheme.onSurface.withValues(alpha: 0.6),
        ),
      );

  static ExpansionTileThemeData expansionTileTheme(ColorScheme scheme) =>
      ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        iconColor: scheme.primary,
        collapsedIconColor: scheme.onSurface.withValues(alpha: 0.6),
        textColor: scheme.primary,
        collapsedTextColor: scheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
      );

  static DividerThemeData dividerTheme(ColorScheme scheme) => DividerThemeData(
    color: scheme.outline,
    thickness: 1,
    space: 1,
  );
}
