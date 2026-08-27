import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

enum PriceTagSize { small, medium, large }

class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.price,
    this.originalPrice,
    this.size = PriceTagSize.medium,
    this.currencySymbol = '\$',
  });

  final double price;
  final double? originalPrice;
  final PriceTagSize size;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) {
    final isOnSale = originalPrice != null && originalPrice! > price;
    final style = switch (size) {
      PriceTagSize.small => AppTypography.labelLarge,
      PriceTagSize.medium => AppTypography.titleMedium,
      PriceTagSize.large => AppTypography.headlineSmall,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text('$currencySymbol${price.toStringAsFixed(2)}', style: style),
        if (isOnSale) ...[
          const SizedBox(width: 8),
          Text(
            '$currencySymbol${originalPrice!.toStringAsFixed(2)}',
            style: AppTypography.bodyMedium.copyWith(
              decoration: TextDecoration.lineThrough,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ],
    );
  }
}
