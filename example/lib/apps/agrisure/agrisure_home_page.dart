import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'agrisure_model.dart';
import 'seed_detail_page.dart';

class AgriSureHomePage extends StatelessWidget {
  const AgriSureHomePage({super.key, required this.onAddToCart});

  final ValueChanged<Seed> onAddToCart;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemCount: AgriSureData.seeds.length,
      itemBuilder: (context, i) {
        final seed = AgriSureData.seeds[i];
        return ThemeCard(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SeedDetailPage(seed: seed, onAddToCart: onAddToCart),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(seed.icon, size: 36, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 8),
                  ThemeText(seed.name, ThemeFont.inter, ThemeFontSize.size16, weight: FontWeight.w600),
                  const SizedBox(height: 4),
                  ThemeChip(label: seed.category),
                  const Spacer(),
                  ThemeText(
                    '₹${seed.price.toStringAsFixed(0)}/${seed.unit}',
                    ThemeFont.inter,
                    ThemeFontSize.size14,
                    color: Theme.of(context).colorScheme.primary,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
