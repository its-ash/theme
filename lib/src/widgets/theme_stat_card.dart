import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';
import 'package:theme/src/components/theme_card.dart';

enum ThemeStatTrend { up, down, neutral }

class ThemeStatCard extends StatelessWidget {
  const ThemeStatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.trend,
    this.trendLabel,
  });

  final String label;
  final String value;
  final IconData? icon;
  final ThemeStatTrend? trend;
  final String? trendLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (trendColor, trendIcon) = switch (trend) {
      ThemeStatTrend.up => (Colors.green.shade600, Icons.arrow_upward),
      ThemeStatTrend.down => (scheme.error, Icons.arrow_downward),
      ThemeStatTrend.neutral => (scheme.onSurface.withValues(alpha: 0.6), Icons.remove),
      null => (null, null),
    };

    return ThemeCard(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: scheme.onSurface.withValues(alpha: 0.6)),
                  const SizedBox(width: 6),
                ],
                Expanded(
                  child: Text(
                    label,
                    style: AppTypography.bodyMedium.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(value, style: AppTypography.headlineSmall),
            if (trend != null && trendLabel != null) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(trendIcon, size: 14, color: trendColor),
                  const SizedBox(width: 4),
                  Text(
                    trendLabel!,
                    style: AppTypography.labelLarge.copyWith(color: trendColor),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
