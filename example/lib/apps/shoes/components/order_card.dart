import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/models/shoe_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order, this.onTap, this.onTrack});

  final Order order;
  final VoidCallback? onTap;
  final VoidCallback? onTrack;

  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order #${order.id}', style: AppTypography.titleMedium),
                  Text('\$${order.total.toStringAsFixed(2)}', style: AppTypography.titleMedium.copyWith(color: Theme.of(context).colorScheme.primary)),
                ],
              ),
              const SizedBox(height: 4),
              Text('${order.date.day}/${order.date.month}/${order.date.year} • ${order.items.length} items', style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: order.status.color.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(order.status.label, style: AppTypography.labelLarge.copyWith(color: order.status.color)),
                  ),
                  if (onTrack != null && order.status != OrderStatus.delivered && order.status != OrderStatus.cancelled)
                    ThemeButton(label: 'Track', onPressed: onTrack, variant: ThemeButtonVariant.text),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: order.items.take(3).map((item) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundColor: item.selectedColor.withOpacity(0.2),
                    child: Icon(Icons.directions_run, size: 18, color: item.selectedColor),
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}