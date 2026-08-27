import 'package:flutter/material.dart';

import 'package:theme/src/components/theme_navigation_bar.dart';

class ThemeNavigationRail extends StatelessWidget {
  const ThemeNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = false,
  });

  final List<ThemeNavigationDestinationItem> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      extended: extended,
      destinations: destinations
          .map(
            (d) => NavigationRailDestination(
              icon: Icon(d.icon),
              selectedIcon: d.selectedIcon != null ? Icon(d.selectedIcon) : null,
              label: Text(d.label),
            ),
          )
          .toList(),
    );
  }
}
