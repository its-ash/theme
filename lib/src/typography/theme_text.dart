import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeFont {
  inter,
  lato;

  TextStyle textStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    final builder = switch (this) {
      ThemeFont.inter => GoogleFonts.inter,
      ThemeFont.lato => GoogleFonts.lato,
    };
    return builder(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}

enum ThemeFontSize {
  size10(10),
  size12(12),
  size14(14),
  size16(16),
  size18(18),
  size20(20),
  size22(22),
  size24(24),
  size28(28),
  size32(32),
  size36(36),
  size40(40),
  size48(48),
  size56(56);

  const ThemeFontSize(this.value);

  final double value;
}

class ThemeText extends StatelessWidget {
  const ThemeText(
    this.text,
    this.font,
    this.size, {
    super.key,
    this.weight = FontWeight.w400,
    this.color,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final ThemeFont font;
  final ThemeFontSize size;
  final FontWeight weight;
  final Color? color;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: font.textStyle(
        fontSize: size.value,
        fontWeight: weight,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
