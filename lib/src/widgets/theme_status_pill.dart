import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

enum ThemeStatus { success, error, warning, info, neutral }

class ThemeStatusPill extends StatelessWidget {
  const ThemeStatusPill({
    super.key,
    required this.label,
    this.status = ThemeStatus.neutral,
    this.icon,
  });

  final String label;
  final ThemeStatus status;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = switch (status) {
      ThemeStatus.success => Colors.green.shade600,
      ThemeStatus.error => scheme.error,
      ThemeStatus.warning => Colors.orange.shade700,
      ThemeStatus.info => scheme.primary,
      ThemeStatus.neutral => scheme.onSurface.withValues(alpha: 0.6),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(label, style: AppTypography.labelLarge.copyWith(color: color)),
        ],
      ),
    );
  }
}
