import 'package:flutter/material.dart';

class ThemeBottomNavigationBar extends StatelessWidget {
  const ThemeBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: items, currentIndex: currentIndex, onTap: onTap);
  }
}
