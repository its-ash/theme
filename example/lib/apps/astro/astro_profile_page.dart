import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'astro_model.dart';

class AstroProfilePage extends StatelessWidget {
  const AstroProfilePage({
    super.key,
    required this.selectedSign,
    required this.onSelectSign,
  });

  final ZodiacSign selectedSign;
  final ValueChanged<ZodiacSign> onSelectSign;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
          ThemeCard(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.12), shape: BoxShape.circle),
                    child: Center(
                      child: Text(selectedSign.symbol, style: TextStyle(fontSize: 36, color: colorScheme.primary)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ThemeText(selectedSign.name, ThemeFont.inter, ThemeFontSize.size20, weight: FontWeight.w700),
                  ThemeText(selectedSign.dateRange, ThemeFont.lato, ThemeFontSize.size14),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ThemeSectionHeader(title: 'Your Sign'),
          const SizedBox(height: 8),
          ThemeDropdown<ZodiacSign>(
            label: 'Choose your zodiac sign',
            initialSelection: selectedSign,
            items: AstroData.signs
                .map((s) => DropdownMenuEntry(value: s, label: '${s.symbol} ${s.name}'))
                .toList(),
            onSelected: (s) {
              if (s != null) onSelectSign(s);
            },
          ),
          const SizedBox(height: 20),
          const ThemeSectionHeader(title: 'Settings'),
          const SizedBox(height: 8),
          ThemeListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: 'Daily Notifications',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ThemeListTile(
            leading: const Icon(Icons.help_outline),
            title: 'Help & Support',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      );
  }
}
