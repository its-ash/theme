import 'package:flutter/material.dart';

class ThemeAppConfirmDialog {
  ThemeAppConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    String? content,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
    bool barrierDismissible = true,
    IconData? icon,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        icon: icon != null ? Icon(icon, color: isDestructive ? scheme.error : scheme.primary, size: 32) : null,
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(cancelLabel)),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: isDestructive ? scheme.error : scheme.primary,
              foregroundColor: isDestructive ? scheme.onError : scheme.onPrimary,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }
}