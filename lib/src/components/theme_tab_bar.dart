import 'package:flutter/material.dart';

class ThemeTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeTabBar({super.key, required this.tabs, this.controller});

  final List<String> tabs;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs.map((t) => Tab(text: t)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
