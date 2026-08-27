import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 60, backgroundColor: Color(0xFF4CAF50), child: Icon(Icons.check, size: 60, color: Colors.white)),
              const SizedBox(height: 24),
              Text('Order Placed!', style: AppTypography.headlineMedium),
              const SizedBox(height: 12),
              Text('Your order has been successfully placed. You will receive a confirmation email shortly.', textAlign: TextAlign.center, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 8),
              Text('Order #10043', style: AppTypography.titleMedium.copyWith(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 32),
              ThemeButton(label: 'Continue Shopping', onPressed: onContinue),
              const SizedBox(height: 12),
              ThemeButton(label: 'Track Order', onPressed: onContinue, variant: ThemeButtonVariant.text),
            ],
          ),
        ),
      ),
    );
  }
}