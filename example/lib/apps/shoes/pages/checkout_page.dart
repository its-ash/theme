import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/checkout_summary.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.onNavTap, required this.onComplete});

  final ValueChanged<int> onNavTap;
  final VoidCallback onComplete;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentStep = 0;
  String _selectedPayment = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ThemeAppBar(title: 'Checkout'),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep++);
          } else {
            widget.onComplete();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          } else {
            Navigator.pop(context);
          }
        },
        steps: [
          Step(
            title: const Text('Shipping Address'),
            content: Column(
              children: [
                const ThemeTextField(labelText: 'Full Name', prefixIcon: Icons.person_outline),
                const SizedBox(height: 12),
                const ThemeTextField(labelText: 'Address', prefixIcon: Icons.location_on_outlined),
                const SizedBox(height: 12),
                const ThemeTextField(labelText: 'City', prefixIcon: Icons.location_city),
                const SizedBox(height: 12),
                const ThemeTextField(labelText: 'ZIP Code', prefixIcon: Icons.markunread_mailbox),
                const SizedBox(height: 12),
                const ThemeTextField(labelText: 'Phone', prefixIcon: Icons.phone),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Payment Method'),
            content: Column(
              children: [
                ThemeListTile(
                  leading: const Icon(Icons.credit_card),
                  title: 'Credit/Debit Card',
                  subtitle: 'Visa, Mastercard, Amex',
                  trailing: ThemeRadio<String>(value: 'card', groupValue: _selectedPayment, onChanged: (v) => setState(() => _selectedPayment = v!)),
                  onTap: () => setState(() => _selectedPayment = 'card'),
                ),
                ThemeListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: 'PayPal',
                  trailing: ThemeRadio<String>(value: 'paypal', groupValue: _selectedPayment, onChanged: (v) => setState(() => _selectedPayment = v!)),
                  onTap: () => setState(() => _selectedPayment = 'paypal'),
                ),
                ThemeListTile(
                  leading: const Icon(Icons.apple),
                  title: 'Apple Pay',
                  trailing: ThemeRadio<String>(value: 'apple', groupValue: _selectedPayment, onChanged: (v) => setState(() => _selectedPayment = v!)),
                  onTap: () => setState(() => _selectedPayment = 'apple'),
                ),
                ThemeListTile(
                  leading: const Icon(Icons.money),
                  title: 'Cash on Delivery',
                  trailing: ThemeRadio<String>(value: 'cod', groupValue: _selectedPayment, onChanged: (v) => setState(() => _selectedPayment = v!)),
                  onTap: () => setState(() => _selectedPayment = 'cod'),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Review Order'),
            content: const CheckoutSummary(subtotal: 459.98, shipping: 0, tax: 36.80),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}