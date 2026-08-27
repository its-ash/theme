import 'package:flutter/material.dart';

class ThemeSnackBar {
  ThemeSnackBar._();

  static void show(BuildContext context, String message, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), action: action),
    );
  }
}
