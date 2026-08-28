import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class AppShellSection extends StatefulWidget {
  const AppShellSection({super.key});

  @override
  State<AppShellSection> createState() => _AppShellSectionState();
}

class _AppShellSectionState extends State<AppShellSection> {
  IconData? _selectedIcon = Icons.star;
  String? _selectedEmoji;
  Color? _selectedColor = Colors.blue;

  static const _icons = [
    Icons.star,
    Icons.favorite,
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.shopping_bag,
    Icons.notifications,
    Icons.search,
    Icons.camera_alt,
    Icons.map,
    Icons.chat_bubble,
    Icons.lock,
  ];

  static const _emojis = ['😀', '😂', '😍', '🎉', '🔥', '👍', '🙌', '💡', '🚀', '❤️', '✅', '⭐'];

  static const _colors = [
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeSplashScreen',
          child: SizedBox(
            height: 260,
            child: ThemeCard(
              margin: EdgeInsets.zero,
              child: const ThemeSplashScreen(
                logo: Icon(Icons.auto_awesome, size: 48),
                appName: 'App Name',
                tagline: 'Built with theme',
              ),
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeErrorPage',
          description: '.notFound() / .forbidden() / .serverError() — 404 shown here',
          child: SizedBox(
            height: 320,
            child: ThemeCard(
              margin: EdgeInsets.zero,
              child: ThemeErrorPage.notFound(onAction: () {}),
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeAppDialog',
          description: 'Generic dialog shell for arbitrary widget content',
          child: ThemeButton(
            label: 'Show dialog',
            onPressed: () => ThemeAppDialog.show<void>(
              context,
              title: 'Add to collection',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ThemeTextField(labelText: 'Collection name', hintText: 'Summer picks'),
                ],
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Create')),
              ],
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeCommandPalette',
          description: 'A ⌘K-style searchable command list',
          child: ThemeButton(
            label: 'Open command palette',
            onPressed: () async {
              final command = await ThemeCommandPalette.show(
                context,
                commands: const [
                  ThemeCommand(id: 'new', label: 'New file', icon: Icons.note_add_outlined, shortcut: '⌘N'),
                  ThemeCommand(id: 'open', label: 'Open project', icon: Icons.folder_open_outlined, shortcut: '⌘O'),
                  ThemeCommand(id: 'settings', label: 'Open settings', icon: Icons.settings_outlined, shortcut: '⌘,'),
                  ThemeCommand(id: 'theme', label: 'Toggle theme', icon: Icons.dark_mode_outlined),
                ],
              );
              if (context.mounted && command != null) {
                Notify.info(context, 'Ran "${command.label}"');
              }
            },
          ),
        ),
        ShowcaseTile(
          title: 'ThemeIconPicker',
          child: ThemeIconPicker(
            icons: _icons,
            selected: _selectedIcon,
            onSelected: (icon) => setState(() => _selectedIcon = icon),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeEmojiPicker',
          child: ThemeEmojiPicker(
            emojis: _emojis,
            onSelected: (emoji) => setState(() => _selectedEmoji = emoji),
          ),
        ),
        if (_selectedEmoji != null)
          ShowcaseTile(
            title: 'Selected emoji',
            child: Text(_selectedEmoji!, style: const TextStyle(fontSize: 32)),
          ),
        ShowcaseTile(
          title: 'ThemeColorPicker',
          child: ThemeColorPicker(
            colors: _colors,
            selected: _selectedColor,
            onSelected: (color) => setState(() => _selectedColor = color),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeFileUploader',
          child: ThemeFileUploader(
            type: FileType.any,
            onFilesPicked: (_) {},
          ),
        ),
      ],
    );
  }
}
