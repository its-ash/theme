import 'package:flutter/material.dart';

class ThemeDialog {
  ThemeDialog._();

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: actions,
      ),
    );
  }
}
