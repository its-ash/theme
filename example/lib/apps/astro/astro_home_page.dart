import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'astro_model.dart';
import 'horoscope_detail_page.dart';

class AstroHomePage extends StatelessWidget {
  const AstroHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final signOfTheDay = AstroData.signs[DateTime.now().day % AstroData.signs.length];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
          ThemeCard(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HoroscopeDetailPage(sign: signOfTheDay)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(signOfTheDay.symbol, style: TextStyle(fontSize: 30, color: colorScheme.primary)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThemeText('Sign of the Day', ThemeFont.lato, ThemeFontSize.size12),
                          const SizedBox(height: 4),
                          ThemeText(signOfTheDay.name, ThemeFont.inter, ThemeFontSize.size20, weight: FontWeight.w700),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ThemeSectionHeader(title: 'All Signs'),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: AstroData.signs.length,
            itemBuilder: (context, i) {
              final sign = AstroData.signs[i];
              return ThemeCard(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HoroscopeDetailPage(sign: sign)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(sign.symbol, style: TextStyle(fontSize: 32, color: colorScheme.primary)),
                        const SizedBox(height: 8),
                        ThemeText(sign.name, ThemeFont.inter, ThemeFontSize.size12, weight: FontWeight.w600),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
  }
}
