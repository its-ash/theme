import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'astro_model.dart';

class CompatibilityPage extends StatefulWidget {
  const CompatibilityPage({super.key});

  @override
  State<CompatibilityPage> createState() => _CompatibilityPageState();
}

class _CompatibilityPageState extends State<CompatibilityPage> {
  ZodiacSign? _signA;
  ZodiacSign? _signB;

  int get _score {
    if (_signA == null || _signB == null) return 0;
    final seed = (_signA!.name.length * 7 + _signB!.name.length * 13) % 41;
    return 55 + seed;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
          const ThemeSectionHeader(
            title: 'Check your match',
            subtitle: 'Pick two signs to see how compatible they are',
          ),
          const SizedBox(height: 20),
          ThemeDropdown<ZodiacSign>(
            label: 'First sign',
            items: AstroData.signs
                .map((s) => DropdownMenuEntry(value: s, label: '${s.symbol} ${s.name}'))
                .toList(),
            onSelected: (s) => setState(() => _signA = s),
          ),
          const SizedBox(height: 16),
          ThemeDropdown<ZodiacSign>(
            label: 'Second sign',
            items: AstroData.signs
                .map((s) => DropdownMenuEntry(value: s, label: '${s.symbol} ${s.name}'))
                .toList(),
            onSelected: (s) => setState(() => _signB = s),
          ),
          const SizedBox(height: 32),
          if (_signA != null && _signB != null)
            ThemeCard(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_signA!.symbol, style: TextStyle(fontSize: 40, color: colorScheme.primary)),
                        const SizedBox(width: 16),
                        const Icon(Icons.favorite, size: 28),
                        const SizedBox(width: 16),
                        Text(_signB!.symbol, style: TextStyle(fontSize: 40, color: colorScheme.primary)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ThemeText(
                      '$_score%',
                      ThemeFont.inter,
                      ThemeFontSize.size40,
                      weight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 4),
                    ThemeText(
                      '${_signA!.name} & ${_signB!.name}',
                      ThemeFont.lato,
                      ThemeFontSize.size16,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
  }
}
