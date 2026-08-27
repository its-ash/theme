import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'astro_model.dart';

class HoroscopeDetailPage extends StatelessWidget {
  const HoroscopeDetailPage({super.key, required this.sign});

  final ZodiacSign sign;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: ThemeAppBar(title: sign.name),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.12), shape: BoxShape.circle),
              child: Center(
                child: Text(sign.symbol, style: TextStyle(fontSize: 56, color: colorScheme.primary)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ThemeText(sign.name, ThemeFont.inter, ThemeFontSize.size28, weight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Center(
            child: ThemeText(sign.dateRange, ThemeFont.lato, ThemeFontSize.size14),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThemeChip(label: sign.element),
              const SizedBox(width: 8),
              ThemeChip(label: 'Lucky #${sign.luckyNumber}'),
              const SizedBox(width: 8),
              ThemeChip(label: sign.luckyColor),
            ],
          ),
          const SizedBox(height: 24),
          const ThemeDivider(),
          const SizedBox(height: 24),
          const ThemeSectionHeader(title: "Today's Reading"),
          const SizedBox(height: 8),
          ThemeText(sign.reading, ThemeFont.lato, ThemeFontSize.size16),
        ],
      ),
    );
  }
}
