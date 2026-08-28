import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeCard',
          description: 'Elevated container with theme-aware shadow and rounded corners',
          child: ThemeCard(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ThemeText('Card content', ThemeFont.inter, ThemeFontSize.size14),
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeDivider / ThemeVerticalDivider',
          child: Column(
            children: [
              const ThemeDivider(),
              const SizedBox(height: 12),
              SizedBox(
                height: 32,
                child: Row(
                  children: const [
                    Text('Left'),
                    ThemeVerticalDivider(),
                    Text('Right'),
                  ],
                ),
              ),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeTooltip',
          child: const ThemeTooltip(
            message: 'This is a tooltip',
            child: Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }
}
