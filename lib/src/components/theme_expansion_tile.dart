import 'package:flutter/material.dart';

class ThemeExpansionTile extends StatelessWidget {
  const ThemeExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.leading,
    this.initiallyExpanded = false,
  });

  final String title;
  final List<Widget> children;
  final Widget? leading;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      leading: leading,
      initiallyExpanded: initiallyExpanded,
      children: children,
    );
  }
}
