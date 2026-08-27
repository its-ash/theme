import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'astro_drawer.dart';
import 'astro_home_page.dart';
import 'astro_model.dart';
import 'astro_profile_page.dart';
import 'compatibility_page.dart';

class AstroMainNav extends StatefulWidget {
  const AstroMainNav({super.key});

  @override
  State<AstroMainNav> createState() => _AstroMainNavState();
}

class _AstroMainNavState extends State<AstroMainNav> {
  int _index = 0;
  ZodiacSign _selectedSign = AstroData.signs.first;

  static const _titles = ['Astro', 'Compatibility', 'Profile'];

  void _navTo(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(title: _titles[_index]),
      drawer: AstroDrawer(onNavigate: _navTo),
      body: IndexedStack(
        index: _index,
        children: [
          const AstroHomePage(),
          const CompatibilityPage(),
          AstroProfilePage(
            selectedSign: _selectedSign,
            onSelectSign: (sign) => setState(() => _selectedSign = sign),
          ),
        ],
      ),
      bottomNavigationBar: ThemeNavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _navTo,
        destinations: const [
          ThemeNavigationDestinationItem(icon: Icons.auto_awesome_outlined, selectedIcon: Icons.auto_awesome, label: 'Today'),
          ThemeNavigationDestinationItem(icon: Icons.favorite_border, selectedIcon: Icons.favorite, label: 'Match'),
          ThemeNavigationDestinationItem(icon: Icons.person_outline, selectedIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }
}
