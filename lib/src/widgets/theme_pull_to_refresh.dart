import 'package:flutter/material.dart';
import 'package:theme/src/widgets/theme_spinner.dart';

class ThemePullToRefresh extends StatelessWidget {
  const ThemePullToRefresh({
    super.key,
    required this.child,
    this.onRefresh,
    this.displacement = 40,
    this.refreshIndicatorType = ThemeSpinnerType.ripple,
  });

  final Widget child;
  final Future<void> Function()? onRefresh;
  final double displacement;
  final ThemeSpinnerType refreshIndicatorType;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},
      displacement: displacement,
      color: scheme.primary,
      backgroundColor: scheme.surface,
      child: child,
    );
  }
}