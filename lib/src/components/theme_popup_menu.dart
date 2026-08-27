import 'package:flutter/material.dart';

class ThemePopupMenu<T> extends StatelessWidget {
  const ThemePopupMenu({
    super.key,
    required this.items,
    this.onSelected,
    this.icon,
  });

  final List<PopupMenuEntry<T>> items;
  final ValueChanged<T>? onSelected;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      icon: icon,
      itemBuilder: (context) => items,
      onSelected: onSelected,
    );
  }
}
