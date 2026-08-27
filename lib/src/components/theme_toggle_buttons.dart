import 'package:flutter/material.dart';

class ThemeToggleButtons extends StatelessWidget {
  const ThemeToggleButtons({
    super.key,
    required this.children,
    required this.isSelected,
    required this.onPressed,
  });

  final List<Widget> children;
  final List<bool> isSelected;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(isSelected: isSelected, onPressed: onPressed, children: children);
  }
}
