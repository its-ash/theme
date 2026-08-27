import 'package:flutter/material.dart';

class ThemeDatePicker {
  ThemeDatePicker._();

  static Future<DateTime?> show(
    BuildContext context, {
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? initialDate,
  }) {
    return showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: initialDate ?? DateTime.now(),
    );
  }
}
