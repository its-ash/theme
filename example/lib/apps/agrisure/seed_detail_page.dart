import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'agrisure_model.dart';

class SeedDetailPage extends StatelessWidget {
  const SeedDetailPage({super.key, required this.seed, required this.onAddToCart});

  final Seed seed;
  final ValueChanged<Seed> onAddToCart;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: ThemeAppBar(title: seed.name),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(seed.icon, size: 48, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: 20),
          ThemeText(seed.name, ThemeFont.inter, ThemeFontSize.size24, weight: FontWeight.w700),
          const SizedBox(height: 8),
          ThemeChip(label: seed.category),
          const SizedBox(height: 16),
          Row(
            children: [
              ThemeText(
                '₹${seed.price.toStringAsFixed(0)}',
                ThemeFont.inter,
                ThemeFontSize.size28,
                weight: FontWeight.w700,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 4),
              ThemeText('per ${seed.unit}', ThemeFont.lato, ThemeFontSize.size14),
              const Spacer(),
              const Icon(Icons.star, size: 18, color: Colors.amber),
              const SizedBox(width: 4),
              ThemeText('${seed.rating}', ThemeFont.lato, ThemeFontSize.size14),
            ],
          ),
          const SizedBox(height: 20),
          const ThemeDivider(),
          const SizedBox(height: 20),
          const ThemeSectionHeader(title: 'About this seed'),
          const SizedBox(height: 8),
          ThemeText(seed.description, ThemeFont.lato, ThemeFontSize.size14),
          const SizedBox(height: 32),
          ThemeButton(
            label: 'Add to Cart',
            icon: Icons.shopping_cart_outlined,
            onPressed: () {
              onAddToCart(seed);
              ThemeSnackBar.show(context, '${seed.name} added to cart');
            },
          ),
        ],
      ),
    );
  }
}
