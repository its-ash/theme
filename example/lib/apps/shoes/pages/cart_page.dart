import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/cart_item_tile.dart';
import '/apps/shoes/components/checkout_summary.dart';
import '/models/shoe_model.dart';
import '/models/shoe_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.onBrowse, required this.onCheckout});

  final VoidCallback onBrowse;
  final VoidCallback onCheckout;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _items = [
    CartItem(
      shoe: ShoeData.shoes[0],
      selectedSize: '10',
      selectedColor: const Color(0xFF1976D2),
      quantity: 1,
    ),
    CartItem(
      shoe: ShoeData.shoes[4],
      selectedSize: '9',
      selectedColor: const Color(0xFF8BC34A),
      quantity: 2,
    ),
  ];

  double get _subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);
  double get _shipping => _subtotal > 100 ? 0 : 9.99;
  double get _tax => _subtotal * 0.08;

  void _inc(int i) => setState(
    () => _items[i] = _items[i].copyWith(quantity: _items[i].quantity + 1),
  );
  void _dec(int i) => setState(() {
    if (_items[i].quantity > 1) {
      _items[i] = _items[i].copyWith(quantity: _items[i].quantity - 1);
    } else {
      _items.removeAt(i);
    }
  });
  void _remove(int i) => setState(() => _items.removeAt(i));

  @override
  Widget build(BuildContext context) {
    return _items.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 64,
                  color: Color(0xFFBDBDBD),
                ),
                const SizedBox(height: 16),
                Text('Cart is empty', style: AppTypography.titleMedium),
                const SizedBox(height: 8),
                ThemeButton(
                  label: 'Shop Now',
                  onPressed: widget.onBrowse,
                ),
              ],
            ),
          )
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ..._items.asMap().entries.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CartItemTile(
                    item: e.value,
                    onIncrement: () => _inc(e.key),
                    onDecrement: () => _dec(e.key),
                    onRemove: () => _remove(e.key),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CheckoutSummary(
                subtotal: _subtotal,
                shipping: _shipping,
                tax: _tax,
                onCheckout: widget.onCheckout,
              ),
            ],
          );
  }
}
