import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/models/shoe_model.dart';
import 'size_color_selector.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({
    super.key,
    required this.shoe,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  final Shoe shoe;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Theme.of(context).dividerColor, borderRadius: BorderRadius.circular(2))),
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.all(20),
                  children: [
                    _ProductHeader(shoe: shoe),
                    const SizedBox(height: 20),
                    Text('Select Size', style: AppTypography.titleMedium),
                    const SizedBox(height: 12),
                    ShoeSizeSelector(
                      sizes: shoe.sizes,
                      selectedSize: shoe.sizes.first,
                      onSelected: (_) {},
                    ),
                    const SizedBox(height: 20),
                    Text('Select Color', style: AppTypography.titleMedium),
                    const SizedBox(height: 12),
                    ShoeColorSelector(
                      colorOptions: shoe.colors.map((c) => Color(int.parse('FF${c.replaceAll('#', '')}', radix: 16))).toList(),
                      selectedColor: Color(int.parse('FF${shoe.colors.first.replaceAll('#', '')}', radix: 16)),
                      onSelected: (_) {},
                    ),
                    const SizedBox(height: 20),
                    Text('Description', style: AppTypography.titleMedium),
                    const SizedBox(height: 8),
                    Text(shoe.description, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              _BottomActions(shoe: shoe, onAddToCart: onAddToCart, onBuyNow: onBuyNow),
            ],
          ),
        );
      },
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(int.parse('FF${shoe.colors.first.replaceAll('#', '')}', radix: 16)).withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.directions_run, size: 36, color: Color(int.parse('FF${shoe.colors.first.replaceAll('#', '')}', radix: 16))),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shoe.name, style: AppTypography.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(shoe.brand, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 8),
              RatingStars(rating: shoe.rating, size: 14),
            ],
          ),
        ),
        PriceTag(price: shoe.price, originalPrice: shoe.originalPrice, size: PriceTagSize.large),
      ],
    );
  }
}

class _BottomActions extends StatelessWidget {
  const _BottomActions({required this.shoe, required this.onAddToCart, required this.onBuyNow});

  final Shoe shoe;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: AddToCartButton(
              onPressed: onAddToCart,
              variant: AddToCartVariant.outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ThemeButton(label: 'Buy Now', onPressed: onBuyNow, icon: Icons.bolt),
          ),
        ],
      ),
    );
  }
}