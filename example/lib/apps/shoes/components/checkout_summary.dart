import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    this.onCheckout,
  });

  final double subtotal;
  final double shipping;
  final double tax;
  final VoidCallback? onCheckout;

  double get total => subtotal + shipping + tax;

  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary', style: AppTypography.titleLarge),
            const SizedBox(height: 16),
            _Row(label: 'Subtotal', value: '\$${subtotal.toStringAsFixed(2)}'),
            _Row(label: 'Shipping', value: shipping == 0 ? 'FREE' : '\$${shipping.toStringAsFixed(2)}'),
            _Row(label: 'Tax', value: '\$${tax.toStringAsFixed(2)}'),
            const ThemeDivider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: AppTypography.titleLarge),
                Text('\$${total.toStringAsFixed(2)}', style: AppTypography.headlineSmall.copyWith(color: Theme.of(context).colorScheme.primary)),
              ],
            ),
            if (onCheckout != null) ...[
              const SizedBox(height: 16),
              ThemeButton(label: 'Proceed to Checkout', onPressed: onCheckout),
            ],
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
          Text(value, style: AppTypography.bodyLarge),
        ],
      ),
    );
  }
}