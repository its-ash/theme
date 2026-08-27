import 'package:flutter/material.dart';

class ThemeBadge extends StatelessWidget {
  const ThemeBadge({
    super.key,
    required this.child,
    this.label,
    this.isVisible = true,
  });

  final Widget child;
  final String? label;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: label != null ? Text(label!) : null,
      isLabelVisible: isVisible,
      child: child,
    );
  }
}
