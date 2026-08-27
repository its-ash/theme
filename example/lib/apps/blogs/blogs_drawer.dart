import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class BlogsDrawer extends StatelessWidget {
  const BlogsDrawer({super.key, required this.onNavigate});

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
                  child: Icon(Icons.article_outlined, color: colorScheme.primary),
                ),
                const SizedBox(height: 12),
                ThemeText(
                  'Blogs',
                  ThemeFont.lato,
                  ThemeFontSize.size22,
                  weight: FontWeight.w700,
                  color: colorScheme.onPrimary,
                ),
                ThemeText(
                  'Stories worth reading',
                  ThemeFont.lato,
                  ThemeFontSize.size12,
                  color: colorScheme.onPrimary.withValues(alpha: 0.85),
                ),
              ],
            ),
          ),
          ThemeListTile(
            leading: const Icon(Icons.home_outlined),
            title: 'Home',
            onTap: () {
              Navigator.pop(context);
              onNavigate(0);
            },
          ),
          ThemeListTile(
            leading: const Icon(Icons.bookmark_border),
            title: 'Bookmarks',
            onTap: () {
              Navigator.pop(context);
              onNavigate(1);
            },
          ),
          ThemeListTile(
            leading: const Icon(Icons.settings_outlined),
            title: 'Settings',
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
