import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/shoes_app.dart';
import '/apps/agrisure/agrisure_app.dart';
import '/apps/blogs/blogs_app.dart';
import '/apps/astro/astro_app.dart';

class _AppEntry {
  const _AppEntry({
    required this.name,
    required this.tagline,
    required this.icon,
    required this.color,
    required this.builder,
  });

  final String name;
  final String tagline;
  final IconData icon;
  final Color color;
  final WidgetBuilder builder;
}

class AppLauncherPage extends StatelessWidget {
  const AppLauncherPage({super.key});

  static final _apps = [
    _AppEntry(
      name: 'SneakerHead',
      tagline: 'Shop the latest sneakers',
      icon: Icons.shopping_bag_outlined,
      color: const Color(0xFF1976D2),
      builder: (_) => const ShoesApp(),
    ),
    _AppEntry(
      name: 'AgriSure',
      tagline: 'Quality seeds for every farm',
      icon: Icons.grass,
      color: const Color(0xFF2E7D32),
      builder: (_) => const AgriSureApp(),
    ),
    _AppEntry(
      name: 'Blogs',
      tagline: 'Stories worth reading',
      icon: Icons.article_outlined,
      color: const Color(0xFFEF6C00),
      builder: (_) => const BlogsApp(),
    ),
    _AppEntry(
      name: 'Astro',
      tagline: 'Your daily cosmic forecast',
      icon: Icons.auto_awesome,
      color: const Color(0xFF6A1B9A),
      builder: (_) => const AstroApp(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ThemeAppBar(title: 'Theme Showcase'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ThemeSectionHeader(
              title: 'Pick an app',
              subtitle: 'Each app overrides the shared theme with its own color scheme',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.95,
                ),
                itemCount: _apps.length,
                itemBuilder: (context, i) {
                  final app = _apps[i];
                  return ThemeCard(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: app.builder),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: app.color.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(app.icon, color: app.color),
                            ),
                            const SizedBox(height: 16),
                            ThemeText(app.name, ThemeFont.inter, ThemeFontSize.size16, weight: FontWeight.w700),
                            const SizedBox(height: 4),
                            ThemeText(app.tagline, ThemeFont.lato, ThemeFontSize.size12),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
