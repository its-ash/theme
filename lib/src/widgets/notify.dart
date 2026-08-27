import 'package:flutter/material.dart';

enum NotifyType { success, error, warning, info }

class Notify {
  Notify._();

  static void show(
    BuildContext context,
    String message, {
    NotifyType type = NotifyType.info,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final (bg, fg, icon) = switch (type) {
      NotifyType.success => (Colors.green.shade600, Colors.white, Icons.check_circle_outline),
      NotifyType.error => (scheme.error, scheme.onError, Icons.error_outline),
      NotifyType.warning => (Colors.orange.shade700, Colors.white, Icons.warning_amber_outlined),
      NotifyType.info => (scheme.inverseSurface, scheme.onInverseSurface, Icons.info_outline),
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: bg,
          duration: duration,
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: Row(
            children: [
              Icon(icon, color: fg),
              const SizedBox(width: 12),
              Expanded(child: Text(message, style: TextStyle(color: fg))),
            ],
          ),
        ),
      );
  }

  static void success(BuildContext context, String message, {Duration? duration}) =>
      show(context, message, type: NotifyType.success, duration: duration ?? const Duration(seconds: 3));

  static void error(BuildContext context, String message, {Duration? duration}) =>
      show(context, message, type: NotifyType.error, duration: duration ?? const Duration(seconds: 3));

  static void warning(BuildContext context, String message, {Duration? duration}) =>
      show(context, message, type: NotifyType.warning, duration: duration ?? const Duration(seconds: 3));

  static void info(BuildContext context, String message, {Duration? duration}) =>
      show(context, message, type: NotifyType.info, duration: duration ?? const Duration(seconds: 3));
}
