import 'package:flutter/material.dart';

enum ThemeProgressIndicatorType { linear, circular }

class ThemeProgressIndicator extends StatelessWidget {
  const ThemeProgressIndicator({
    super.key,
    this.type = ThemeProgressIndicatorType.circular,
    this.value,
  });

  final ThemeProgressIndicatorType type;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ThemeProgressIndicatorType.linear => LinearProgressIndicator(value: value),
      ThemeProgressIndicatorType.circular => CircularProgressIndicator(value: value),
    };
  }
}
