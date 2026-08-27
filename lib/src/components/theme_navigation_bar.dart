import 'package:flutter/material.dart';

class ThemeNavigationDestinationItem {
  const ThemeNavigationDestinationItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
}

class ThemeNavigationBar extends StatelessWidget {
  const ThemeNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final List<ThemeNavigationDestinationItem> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: destinations
          .map(
            (d) => NavigationDestination(
              icon: Icon(d.icon),
              selectedIcon: d.selectedIcon != null ? Icon(d.selectedIcon) : null,
              label: d.label,
            ),
          )
          .toList(),
    );
  }
}
