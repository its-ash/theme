import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    required this.child,
    this.color,
    this.borderRadius = 16,
    this.clipBehavior = Clip.antiAlias,
    this.margin = const EdgeInsets.all(8),
  });

  final Widget child;
  final Color? color;
  final double borderRadius;
  final Clip clipBehavior;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final shadows =
        Theme.of(context).extension<AppShadowTheme>() ?? const AppShadowTheme();
    final radius = BorderRadius.circular(borderRadius);

    return Container(
      margin: margin,
      decoration: BoxDecoration(borderRadius: radius, boxShadow: shadows.cardShadow),
      child: Material(
        color: color ?? Theme.of(context).colorScheme.surface,
        borderRadius: radius,
        clipBehavior: clipBehavior,
        child: child,
      ),
    );
  }
}
