import 'package:flutter/material.dart';



class AppShadowTheme extends ThemeExtension<AppShadowTheme> {
  const AppShadowTheme({
    this.none = const BoxShadow(
      color: Colors.transparent,
      blurRadius: 0,
      offset: Offset.zero,
    ),
    this.hairline = const BoxShadow(
      color: Color(0x0D11111A),
      blurRadius: 0,
      offset: Offset(0, 1),
    ),
    this.shadowOne = const BoxShadow(
      color: Color(0x1A11111A),
      blurRadius: 8,
      offset: Offset.zero,
    ),
    this.shadowTwo = const BoxShadow(
      color: Color(0x29000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
    this.shadowThree = const BoxShadow(
      color: Color(0x33000000),
      blurRadius: 12,
      offset: Offset(0, 8),
    ),
    this.cardShadows,
    this.buttonShadows,
  });

  const AppShadowTheme.dark({
    this.none = const BoxShadow(
      color: Colors.transparent,
      blurRadius: 0,
      offset: Offset.zero,
    ),
    this.hairline = const BoxShadow(
      color: Color(0x1FFFFFFF),
      blurRadius: 0,
      offset: Offset(0, 1),
    ),
    this.shadowOne = const BoxShadow(
      color: Color(0x99000000),
      blurRadius: 10,
      offset: Offset(0, 2),
    ),
    this.shadowTwo = const BoxShadow(
      color: Color(0xB3000000),
      blurRadius: 14,
      offset: Offset(0, 6),
    ),
    this.shadowThree = const BoxShadow(
      color: Color(0xCC000000),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
    this.cardShadows,
    this.buttonShadows,
  });

  final BoxShadow none;
  final BoxShadow hairline;
  final BoxShadow shadowOne;
  final BoxShadow shadowTwo;
  final BoxShadow shadowThree;
  final List<BoxShadow>? cardShadows;
  final List<BoxShadow>? buttonShadows;

  /// Shadows for a card surface. Defaults to a subtle two-layer lift.
  /// Per-style presets override [cardShadows] to match the design language.
  List<BoxShadow> get cardShadow => cardShadows ?? [hairline, shadowOne];

  /// Shadows for an elevated button. Defaults to a single soft drop.
  /// Neumorphism/brutalism/claymorphism presets override [buttonShadows].
  List<BoxShadow> get buttonShadow =>
      buttonShadows ?? ([shadowOne].where((s) => s.color != Colors.transparent).toList());

  /// Shadows for a dialog / sheet — the heaviest lift.
  List<BoxShadow> get dialogShadow => [shadowTwo, shadowThree];

  @override
  AppShadowTheme copyWith({
    BoxShadow? none,
    BoxShadow? hairline,
    BoxShadow? shadowOne,
    BoxShadow? shadowTwo,
    BoxShadow? shadowThree,
    List<BoxShadow>? cardShadows,
    List<BoxShadow>? buttonShadows,
  }) {
    return AppShadowTheme(
      none: none ?? this.none,
      hairline: hairline ?? this.hairline,
      shadowOne: shadowOne ?? this.shadowOne,
      shadowTwo: shadowTwo ?? this.shadowTwo,
      shadowThree: shadowThree ?? this.shadowThree,
      cardShadows: cardShadows ?? this.cardShadows,
      buttonShadows: buttonShadows ?? this.buttonShadows,
    );
  }

  @override
  AppShadowTheme lerp(ThemeExtension<AppShadowTheme>? other, double t) {
    if (other is! AppShadowTheme) return this;
    return AppShadowTheme(
      none: BoxShadow.lerp(none, other.none, t) ?? none,
      hairline: BoxShadow.lerp(hairline, other.hairline, t) ?? hairline,
      shadowOne: BoxShadow.lerp(shadowOne, other.shadowOne, t) ?? shadowOne,
      shadowTwo: BoxShadow.lerp(shadowTwo, other.shadowTwo, t) ?? shadowTwo,
      shadowThree:
          BoxShadow.lerp(shadowThree, other.shadowThree, t) ?? shadowThree,
      cardShadows: t < 0.5 ? cardShadows : other.cardShadows,
      buttonShadows: t < 0.5 ? buttonShadows : other.buttonShadows,
    );
  }
}
