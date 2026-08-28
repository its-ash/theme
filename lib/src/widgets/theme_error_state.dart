import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';
import 'package:theme/src/components/theme_button.dart';

class ThemeErrorState extends StatelessWidget {
  const ThemeErrorState({
    super.key,
    this.title = 'Something went wrong',
    this.subtitle,
    this.icon = Icons.error_outline,
    this.retryLabel = 'Retry',
    this.onRetry,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: scheme.error),
            const SizedBox(height: 20),
            Text(title, style: AppTypography.titleMedium, textAlign: TextAlign.center),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 20),
              ThemeButton(label: retryLabel, onPressed: onRetry, icon: Icons.refresh),
            ],
          ],
        ),
      ),
    );
  }
}
