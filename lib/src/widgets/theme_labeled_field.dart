import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemeLabeledField extends StatelessWidget {
  const ThemeLabeledField({
    super.key,
    required this.label,
    required this.child,
    this.helperText,
    this.required = false,
  });

  final String label;
  final Widget child;
  final String? helperText;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTypography.labelLarge),
            if (required) ...[
              const SizedBox(width: 2),
              Text('*', style: AppTypography.labelLarge.copyWith(color: scheme.error)),
            ],
          ],
        ),
        const SizedBox(height: 6),
        child,
        if (helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            helperText!,
            style: AppTypography.bodyMedium.copyWith(
              color: scheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ],
    );
  }
}
