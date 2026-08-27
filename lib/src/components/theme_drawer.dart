import 'package:flutter/material.dart';

class ThemeDrawer extends StatelessWidget {
  const ThemeDrawer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: children));
  }
}
