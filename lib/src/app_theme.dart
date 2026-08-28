import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:theme/src/colors/app_colors.dart';
import 'package:theme/src/typography/app_typography.dart';
import 'package:theme/src/components/app_bar_theme.dart';
import 'package:theme/src/components/button_theme.dart';
import 'package:theme/src/components/card_theme.dart';
import 'package:theme/src/components/chip_theme.dart';
import 'package:theme/src/components/dialog_picker_theme.dart';
import 'package:theme/src/components/dropdown_theme.dart';
import 'package:theme/src/components/feedback_theme.dart';
import 'package:theme/src/components/input_theme.dart';
import 'package:theme/src/components/list_theme.dart';
import 'package:theme/src/components/menu_theme.dart';
import 'package:theme/src/components/misc_theme.dart';
import 'package:theme/src/components/navigation_theme.dart';
import 'package:theme/src/components/selection_theme.dart';
import 'package:theme/src/shadows/app_shadow_theme.dart';

class AppTheme {
  AppTheme._();

  static const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    },
  );

  static ThemeData lightTheme({
    ColorScheme? colorScheme,
    TextTheme? textTheme,
    AppShadowTheme shadows = const AppShadowTheme(),
  }) => _theme(
    brightness: Brightness.light,
    scheme: colorScheme ?? AppColors.lightColorScheme,
    textTheme: textTheme ?? AppTypography.lightTextTheme,
    shadows: shadows,
  );

  static ThemeData darkTheme({
    ColorScheme? colorScheme,
    TextTheme? textTheme,
    AppShadowTheme shadows = const AppShadowTheme.dark(),
  }) => _theme(
    brightness: Brightness.dark,
    scheme: colorScheme ?? AppColors.darkColorScheme,
    textTheme: textTheme ?? AppTypography.darkTextTheme,
    shadows: shadows,
  );

  static ThemeData _theme({
    required Brightness brightness,
    required ColorScheme scheme,
    required TextTheme textTheme,
    required AppShadowTheme shadows,
  }) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,

      // GENERAL CONFIGURATION
      applyElevationOverlayColor: isDark,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      pageTransitionsTheme: _pageTransitionsTheme,
      splashFactory: InkRipple.splashFactory,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scrollbarTheme: AppMiscTheme.scrollbarTheme(scheme),

      // COLOR
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
      secondaryHeaderColor: Color.alphaBlend(
        scheme.secondary.withValues(alpha: 0.12),
        scheme.surface,
      ),

      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: IconThemeData(color: scheme.onSurface),
      primaryIconTheme: IconThemeData(color: scheme.onPrimary),
      primaryTextTheme: textTheme.apply(
        bodyColor: scheme.onPrimary,
        displayColor: scheme.onPrimary,
      ),
      typography: Typography.material2021(colorScheme: scheme),

      // COMPONENT THEMES
      actionIconTheme: AppMiscTheme.actionIconTheme,
      appBarTheme: AppAppBarTheme.theme,
      badgeTheme: AppMiscTheme.badgeTheme(scheme),
      bannerTheme: AppFeedbackTheme.bannerTheme(scheme, textTheme),
      bottomAppBarTheme: AppMiscTheme.bottomAppBarTheme(scheme, shadows),
      bottomNavigationBarTheme: AppNavigationTheme.bottomNavigationBarTheme(scheme),
      bottomSheetTheme: AppMiscTheme.bottomSheetTheme(scheme, shadows),
      buttonTheme: AppMiscTheme.buttonTheme(scheme),
      cardTheme: AppCardTheme.theme(scheme, shadows),
      carouselViewTheme: AppMiscTheme.carouselViewTheme(scheme),
      checkboxTheme: AppSelectionThemes.checkboxTheme(scheme),
      chipTheme: AppChipTheme.theme(scheme, textTheme),
      dataTableTheme: AppMiscTheme.dataTableTheme(scheme, textTheme),
      datePickerTheme: AppDialogTheme.datePickerTheme(scheme),
      dialogTheme: AppDialogTheme.theme(scheme, textTheme, shadows),
      dividerTheme: AppListTheme.dividerTheme(scheme),
      drawerTheme: AppNavigationTheme.drawerTheme(scheme, shadows),
      dropdownMenuTheme: AppDropdownTheme.theme(scheme, shadows),
      elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme(scheme, shadows),
      expansionTileTheme: AppListTheme.expansionTileTheme(scheme),
      filledButtonTheme: AppButtonThemes.filledButtonTheme(scheme, shadows),
      floatingActionButtonTheme: AppButtonThemes.floatingActionButtonTheme(scheme),
      iconButtonTheme: AppButtonThemes.iconButtonTheme(scheme),
      inputDecorationTheme: AppInputTheme.theme(scheme),
      listTileTheme: AppListTheme.listTileTheme(scheme, textTheme),
      menuBarTheme: AppMenuTheme.menuBarTheme(scheme),
      menuButtonTheme: AppMenuTheme.menuButtonTheme(scheme),
      menuTheme: AppMenuTheme.menuTheme(scheme, shadows),
      navigationBarTheme: AppNavigationTheme.navigationBarTheme(scheme, textTheme),
      navigationDrawerTheme: AppNavigationTheme.navigationDrawerTheme(scheme, textTheme),
      navigationRailTheme: AppNavigationTheme.navigationRailTheme(scheme, textTheme),
      outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme(scheme),
      popupMenuTheme: AppMenuTheme.popupMenuTheme(scheme, textTheme, shadows),
      progressIndicatorTheme: AppFeedbackTheme.progressIndicatorTheme(scheme),
      radioTheme: AppSelectionThemes.radioTheme(scheme),
      searchBarTheme: AppMenuTheme.searchBarTheme(scheme, textTheme, shadows),
      searchViewTheme: AppMenuTheme.searchViewTheme(scheme, textTheme),
      segmentedButtonTheme: AppMiscTheme.segmentedButtonTheme(scheme),
      sliderTheme: AppSelectionThemes.sliderTheme(scheme),
      snackBarTheme: AppFeedbackTheme.snackBarTheme(scheme, textTheme),
      switchTheme: AppSelectionThemes.switchTheme(scheme),
      tabBarTheme: AppMiscTheme.tabBarTheme(scheme, textTheme),
      textButtonTheme: AppButtonThemes.textButtonTheme(scheme),
      textSelectionTheme: AppMiscTheme.textSelectionTheme(scheme),
      timePickerTheme: AppDialogTheme.timePickerTheme(scheme),
      toggleButtonsTheme: AppMiscTheme.toggleButtonsTheme(scheme),
      tooltipTheme: AppFeedbackTheme.tooltipTheme(scheme, textTheme),

      extensions: [shadows],
    );
  }
}
