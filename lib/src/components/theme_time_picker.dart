import 'package:flutter/material.dart';

class ThemeTimePicker {
  ThemeTimePicker._();

  static Future<TimeOfDay?> show(BuildContext context, {TimeOfDay? initialTime}) {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
  }
}
