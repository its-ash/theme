import 'package:flutter/material.dart';

class ThemeBanner {
  ThemeBanner._();

  static void show(
    BuildContext context, {
    required String message,
    required List<Widget> actions,
  }) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(content: Text(message), actions: actions),
    );
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  }
}
