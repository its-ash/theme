import 'package:flutter/material.dart';

class ThemeBottomAppBar extends StatelessWidget {
  const ThemeBottomAppBar({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: children),
    );
  }
}
