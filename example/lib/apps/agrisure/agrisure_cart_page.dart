import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'agrisure_model.dart';

class AgriSureCartPage extends StatelessWidget {
  const AgriSureCartPage({
    super.key,
    required this.cart,
    required this.onUpdateQuantity,
    required this.onCheckout,
  });

  final List<CartLine> cart;
  final void Function(int index, int quantity) onUpdateQuantity;
  final VoidCallback onCheckout;

  double get _total => cart.fold(0, (sum, line) => sum + line.total);

  @override
  Widget build(BuildContext context) {
    return cart.isEmpty
        ? Center(
            child: ThemeText(
              'Your cart is empty',
              ThemeFont.lato,
              ThemeFontSize.size16,
            ),
          )
        : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, i) {
                      final line = cart[i];
                      return ThemeCard(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(line.seed.icon, color: Theme.of(context).colorScheme.primary),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ThemeText(
                                      line.seed.name,
                                      ThemeFont.inter,
                                      ThemeFontSize.size14,
                                      weight: FontWeight.w600,
                                    ),
                                    ThemeText(
                                      '₹${line.seed.price.toStringAsFixed(0)}/${line.seed.unit}',
                                      ThemeFont.lato,
                                      ThemeFontSize.size12,
                                    ),
                                  ],
                                ),
                              ),
                              ThemeIconButton(
                                icon: Icons.remove_circle_outline,
                                onPressed: () => onUpdateQuantity(i, line.quantity - 1),
                              ),
                              ThemeText('${line.quantity}', ThemeFont.inter, ThemeFontSize.size14, weight: FontWeight.w600),
                              ThemeIconButton(
                                icon: Icons.add_circle_outline,
                                onPressed: () => onUpdateQuantity(i, line.quantity + 1),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ThemeText('Total', ThemeFont.inter, ThemeFontSize.size18, weight: FontWeight.w700),
                          ThemeText(
                            '₹${_total.toStringAsFixed(0)}',
                            ThemeFont.inter,
                            ThemeFontSize.size18,
                            weight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ThemeButton(
                        label: 'Place Order',
                        onPressed: () {
                          onCheckout();
                          ThemeSnackBar.show(context, 'Order placed successfully');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
  }
}
