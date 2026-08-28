import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

/// A generic themed dialog shell for arbitrary widget content —
/// `ThemeDialog` only takes a `String? content`; use this when the body
/// needs real widgets (a form, a list, custom layout).
class ThemeAppDialog {
  ThemeAppDialog._();

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    double? maxWidth,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth ?? 480),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title, style: AppTypography.titleLarge),
                  const SizedBox(height: 16),
                ],
                Flexible(child: content),
                if (actions != null && actions.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
