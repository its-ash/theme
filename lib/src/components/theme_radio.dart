import 'package:flutter/material.dart';

class ThemeRadio<T> extends StatelessWidget {
  const ThemeRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged);
  }
}
