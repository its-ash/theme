import 'package:flutter/material.dart';

class ThemeCheckbox extends StatelessWidget {
  const ThemeCheckbox({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: onChanged);
  }
}
