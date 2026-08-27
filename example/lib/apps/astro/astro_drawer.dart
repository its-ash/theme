import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class AstroDrawer extends StatelessWidget {
  const AstroDrawer({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.auto_awesome, color: colorScheme.primary),
                ),
                const SizedBox(height: 12),
                ThemeText(
                  'Astro',
                  ThemeFont.inter,
                  ThemeFontSize.size22,
                  weight: FontWeight.w700,
                  color: colorScheme.onPrimary,
                ),
                ThemeText(
                  'Your daily cosmic forecast',
                  ThemeFont.lato,
                  ThemeFontSize.size12,
                  color: colorScheme.onPrimary.withValues(alpha: 0.85),
                ),
              ],
            ),
          ),
          ThemeListTile(
            leading: const Icon(Icons.auto_awesome_outlined),
            title: 'Today',
            onTap: () {
              Navigator.pop(context);
              onNavigate(0);
            },
          ),
          ThemeListTile(
            leading: const Icon(Icons.favorite_border),
            title: 'Compatibility',
            onTap: () {
              Navigator.pop(context);
              onNavigate(1);
            },
          ),
          ThemeListTile(
            leading: const Icon(Icons.person_outline),
            title: 'Profile',
            onTap: () {
              Navigator.pop(context);
              onNavigate(2);
            },
          ),
          const ThemeDivider(),
          ThemeListTile(
            leading: const Icon(Icons.apps),
            title: 'Switch App',
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          ),
        ],
      ),
    );
  }
}
