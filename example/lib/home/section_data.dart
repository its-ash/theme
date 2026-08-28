import 'package:flutter/material.dart';

class ShowcaseSection {
  const ShowcaseSection({
    required this.label,
    required this.icon,
    required this.builder,
  });

  final String label;
  final IconData icon;
  final WidgetBuilder builder;
}
