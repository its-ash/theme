import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeText',
          description: 'ThemeFont.inter | ThemeFont.lato, ThemeFontSize.size10..size56',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ThemeText('Inter size24 w700', ThemeFont.inter, ThemeFontSize.size24, weight: FontWeight.w700),
              SizedBox(height: 8),
              ThemeText('Lato size16 w400', ThemeFont.lato, ThemeFontSize.size16),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'AppTypography',
          description: 'Static TextStyle getters matching the app type scale',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('headlineLarge', style: AppTypography.headlineLarge),
              Text('headlineMedium', style: AppTypography.headlineMedium),
              Text('headlineSmall', style: AppTypography.headlineSmall),
              Text('titleLarge', style: AppTypography.titleLarge),
              Text('titleMedium', style: AppTypography.titleMedium),
              Text('bodyLarge', style: AppTypography.bodyLarge),
              Text('bodyMedium', style: AppTypography.bodyMedium),
              Text('labelLarge', style: AppTypography.labelLarge),
            ],
          ),
        ),
      ],
    );
  }
}
