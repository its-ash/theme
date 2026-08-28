import 'package:flutter/material.dart';

class ThemeConfirmDialog {
  ThemeConfirmDialog._();

  /// Shows a confirm/cancel dialog and resolves to `true` only if the
  /// user taps the confirm action; `false`/`null` otherwise (cancel, or
  /// dismissed via barrier/back button).
  static Future<bool> show(
    BuildContext context, {
    required String title,
    String? content,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
    bool barrierDismissible = true,
  }) async {
    final scheme = Theme.of(context).colorScheme;
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              confirmLabel,
              style: TextStyle(color: isDestructive ? scheme.error : scheme.primary),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
