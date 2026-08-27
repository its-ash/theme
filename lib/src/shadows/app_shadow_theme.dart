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
  });

  final BoxShadow none;
  final BoxShadow hairline;
  final BoxShadow shadowOne;
  final BoxShadow shadowTwo;
  final BoxShadow shadowThree;

  List<BoxShadow> get cardShadow => [hairline, shadowOne];

  @override
  AppShadowTheme copyWith({
    BoxShadow? none,
    BoxShadow? hairline,
    BoxShadow? shadowOne,
    BoxShadow? shadowTwo,
    BoxShadow? shadowThree,
  }) {
    return AppShadowTheme(
      none: none ?? this.none,
      hairline: hairline ?? this.hairline,
      shadowOne: shadowOne ?? this.shadowOne,
      shadowTwo: shadowTwo ?? this.shadowTwo,
      shadowThree: shadowThree ?? this.shadowThree,
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
    );
  }
}
