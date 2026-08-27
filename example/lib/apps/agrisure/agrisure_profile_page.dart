import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class AgriSureProfilePage extends StatelessWidget {
  const AgriSureProfilePage({super.key});

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
                    child: Icon(Icons.agriculture, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeText('Ramesh Patel', ThemeFont.inter, ThemeFontSize.size18, weight: FontWeight.w700),
                      ThemeText('Nashik, Maharashtra', ThemeFont.lato, ThemeFontSize.size14),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const ThemeSectionHeader(title: 'Account'),
          const SizedBox(height: 8),
          ThemeListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: 'Order History',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ThemeListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: 'Delivery Address',
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
