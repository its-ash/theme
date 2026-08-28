import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';
import 'package:theme/src/shadows/app_shadow_theme.dart';

/// A complete theme preset: colors, typography, shadows, and shape.
///
/// Pass one to [AppThemePreset.fromPreset] (or use the named constructors
/// like [AppThemePreset.flat]) to generate a fully-themed [ThemeData] in
/// one line. Switching presets at runtime replaces every shadow, color,
/// and radius in the app.
class AppThemePreset {
  const AppThemePreset({
    required this.id,
    required this.name,
    required this.brightness,
    required this.colorScheme,
    required this.shadows,
    this.textTheme,
    this.cardRadius = 16,
    this.cardElevation = 0,
    this.cardMargin = 8,
    this.cardColor,
    this.buttonRadius = 12,
    this.buttonElevation = 0,
    this.inputRadius = 12,
    this.inputFilled = true,
    this.inputBorderWidth = 1,
    this.dialogRadius = 16,
    this.dialogElevation = 0,
    this.fontFamily,
    this.splashFactory,
    this.useMaterial3 = true,
  });

  final String id;
  final String name;
  final Brightness brightness;
  final ColorScheme colorScheme;
  final AppShadowTheme shadows;
  final TextTheme? textTheme;
  final double cardRadius;
  final double cardElevation;
  final double cardMargin;
  final Color? cardColor;
  final double buttonRadius;
  final double buttonElevation;
  final double inputRadius;
  final bool inputFilled;
  final double inputBorderWidth;
  final double dialogRadius;
  final double dialogElevation;
  final String? fontFamily;
  final InteractiveInkFeatureFactory? splashFactory;
  final bool useMaterial3;

  static const _page = PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  });

  ThemeData toThemeData() {
    final scheme = colorScheme;
    final isDark = brightness == Brightness.dark;
    final baseTextTheme = textTheme ??
        (isDark ? AppTypography.darkTextTheme : AppTypography.lightTextTheme);
    final tt = fontFamily != null
        ? baseTextTheme.apply(fontFamily: fontFamily)
        : baseTextTheme;
    return ThemeData(
      useMaterial3: useMaterial3,
      colorScheme: scheme,
      textTheme: tt,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: _page,
      splashFactory: splashFactory ?? InkRipple.splashFactory,
      applyElevationOverlayColor: isDark,
      materialTapTargetSize: MaterialTapTargetSize.padded,

      primaryColor: scheme.primary,
      primaryColorLight: Color.lerp(scheme.primary, Colors.white, 0.3),
      primaryColorDark: Color.lerp(scheme.primary, Colors.black, 0.3),
      canvasColor: scheme.surface,
      cardColor: scheme.surface,
      scaffoldBackgroundColor: scheme.surface,
      shadowColor: shadows.shadowOne.color,
      dividerColor: scheme.outline,
      disabledColor: scheme.onSurface.withValues(alpha: 0.38),
      focusColor: scheme.onSurface.withValues(alpha: 0.1),
      highlightColor: scheme.onSurface.withValues(alpha: 0.1),
      hoverColor: scheme.onSurface.withValues(alpha: 0.08),
      splashColor: scheme.onSurface.withValues(alpha: 0.1),
      hintColor: scheme.onSurface.withValues(alpha: 0.6),
      unselectedWidgetColor: scheme.onSurface.withValues(alpha: 0.6),
      secondaryHeaderColor: Color.alphaBlend(scheme.secondary.withValues(alpha: 0.12), scheme.surface),

      iconTheme: IconThemeData(color: scheme.onSurface),
      primaryIconTheme: IconThemeData(color: scheme.onPrimary),
      primaryTextTheme: tt.apply(bodyColor: scheme.onPrimary, displayColor: scheme.onPrimary),
      typography: Typography.material2021(colorScheme: scheme),

      cardTheme: CardThemeData(
        color: cardColor ?? scheme.surface,
        elevation: cardElevation,
        margin: EdgeInsets.all(cardMargin),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius)),
          elevation: buttonElevation,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius)),
          elevation: buttonElevation,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius)),
        ),
      ),
      inputDecorationTheme: _inputDecorationTheme(scheme),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: scheme.onSurface, fontSize: 14),
        inputDecorationTheme: _inputDecorationTheme(scheme),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            brightness == Brightness.dark ? scheme.surfaceContainerHigh : scheme.surface,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(inputRadius)),
          ),
          elevation: const WidgetStatePropertyAll(8),
          shadowColor: WidgetStatePropertyAll(shadows.shadowOne.color),
        ),
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(scheme.onSurface),
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
          minimumSize: const WidgetStatePropertyAll(Size(64, 40)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dialogRadius)),
        backgroundColor: scheme.surface,
        elevation: dialogElevation,
      ),
      extensions: [shadows],
    );
  }

  InputDecorationTheme _inputDecorationTheme(ColorScheme scheme) => InputDecorationTheme(
    filled: inputFilled,
    fillColor: scheme.surfaceContainerLow,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputRadius),
      borderSide: BorderSide(color: scheme.outline, width: inputBorderWidth),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputRadius),
      borderSide: BorderSide(color: scheme.outline, width: inputBorderWidth),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputRadius),
      borderSide: BorderSide(color: scheme.primary, width: inputBorderWidth + 0.5),
    ),
  );
}