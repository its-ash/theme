import 'package:flutter/material.dart';

class ThemeDivider extends StatelessWidget {
  const ThemeDivider({super.key, this.height, this.indent, this.endIndent});

  final double? height;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(height: height, indent: indent, endIndent: endIndent);
  }
}

class ThemeVerticalDivider extends StatelessWidget {
  const ThemeVerticalDivider({super.key, this.width, this.indent, this.endIndent});

  final double? width;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: width, indent: indent, endIndent: endIndent);
  }
}
