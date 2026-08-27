import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/models/shoe_model.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: item.selectedColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.directions_run, color: item.selectedColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.shoe.name, style: AppTypography.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text('${item.shoe.brand} • Size ${item.selectedSize}', style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
                  const SizedBox(height: 4),
                  Text('\$${item.totalPrice.toStringAsFixed(2)}', style: AppTypography.labelLarge),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _QuantitySelector(quantity: item.quantity, onIncrement: onIncrement, onDecrement: onDecrement),
            IconButton(icon: const Icon(Icons.delete_outline, color: Color(0xFFEF5350)), onPressed: onRemove),
          ],
        ),
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({required this.quantity, required this.onIncrement, required this.onDecrement});

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.remove, size: 18), onPressed: onDecrement, constraints: const BoxConstraints(minWidth: 32, minHeight: 12), padding: EdgeInsets.zero),
          Text('$quantity', style: AppTypography.labelLarge),
          IconButton(icon: const Icon(Icons.add, size: 18), onPressed: onIncrement, constraints: const BoxConstraints(minWidth: 32, minHeight: 12), padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}