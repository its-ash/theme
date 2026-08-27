import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class BlogsSettingsPage extends StatefulWidget {
  const BlogsSettingsPage({super.key});

  @override
  State<BlogsSettingsPage> createState() => _BlogsSettingsPageState();
}

class _BlogsSettingsPageState extends State<BlogsSettingsPage> {
  bool _notifyNewPosts = true;
  bool _weeklyDigest = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
          ThemeCard(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: colorScheme.primary.withValues(alpha: 0.15),
                    child: Icon(Icons.person, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeText('Guest Reader', ThemeFont.lato, ThemeFontSize.size18, weight: FontWeight.w700),
                      ThemeText('guest@blogs.app', ThemeFont.lato, ThemeFontSize.size14),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const ThemeSectionHeader(title: 'Notifications'),
          ThemeCard(
            child: Column(
              children: [
                ListTile(
                  title: ThemeText('New posts', ThemeFont.lato, ThemeFontSize.size14),
                  trailing: ThemeSwitch(
                    value: _notifyNewPosts,
                    onChanged: (v) => setState(() => _notifyNewPosts = v),
                  ),
                ),
                const ThemeDivider(height: 1),
                ListTile(
                  title: ThemeText('Weekly digest', ThemeFont.lato, ThemeFontSize.size14),
                  trailing: ThemeSwitch(
                    value: _weeklyDigest,
                    onChanged: (v) => setState(() => _weeklyDigest = v),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ThemeSectionHeader(title: 'About'),
          ThemeListTile(
            leading: const Icon(Icons.info_outline),
            title: 'About Blogs',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      );
  }
}
