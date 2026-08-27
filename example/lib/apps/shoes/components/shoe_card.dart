import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/models/shoe_model.dart';
import 'badges.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    super.key,
    required this.shoe,
    this.variant = ShoeCardVariant.grid,
    this.onTap,
    this.onFavoriteTap,
  });

  final Shoe shoe;
  final ShoeCardVariant variant;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      ShoeCardVariant.grid => _GridCard(shoe: shoe, onTap: onTap, onFavoriteTap: onFavoriteTap),
      ShoeCardVariant.list => _ListCard(shoe: shoe, onTap: onTap, onFavoriteTap: onFavoriteTap),
      ShoeCardVariant.horizontal => _HorizontalCard(shoe: shoe, onTap: onTap, onFavoriteTap: onFavoriteTap),
    };
  }
}

enum ShoeCardVariant { grid, list, horizontal }

class _GridCard extends StatelessWidget {
  const _GridCard({required this.shoe, this.onTap, this.onFavoriteTap});

  final Shoe shoe;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ThemeCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _ShoeImage(shoe: shoe, aspectRatio: 1.2),
                if (shoe.isFavorite)
                  const Positioned(top: 8, left: 8, child: _FavoriteChip()),
                if (shoe.isOnSale)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: DiscountBadge(
                      discountPercent: ((1 - shoe.price / shoe.originalPrice!) * 100).round(),
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: _FavoriteButton(isFavorite: shoe.isFavorite, onTap: onFavoriteTap),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.brand, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
                  const SizedBox(height: 4),
                  Text(shoe.name, style: AppTypography.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  RatingStars(rating: shoe.rating, size: 14),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: PriceTag(price: shoe.price, originalPrice: shoe.originalPrice, size: PriceTagSize.small),
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: 20, color: Theme.of(context).colorScheme.primary),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({required this.shoe, this.onTap, this.onFavoriteTap});

  final Shoe shoe;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ThemeCard(
        child: Row(
          children: [
            _ShoeImage(shoe: shoe, aspectRatio: 1, width: 120),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shoe.brand, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
                    Text(shoe.name, style: AppTypography.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    RatingStars(rating: shoe.rating, size: 14),
                    const SizedBox(height: 8),
                    PriceTag(price: shoe.price, originalPrice: shoe.originalPrice),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: _FavoriteButton(isFavorite: shoe.isFavorite, onTap: onFavoriteTap),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({required this.shoe, this.onTap, this.onFavoriteTap});

  final Shoe shoe;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 200,
        child: ThemeCard(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ShoeImage(shoe: shoe, aspectRatio: 1.1),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shoe.name, style: AppTypography.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        PriceTag(price: shoe.price, size: PriceTagSize.small),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: _FavoriteButton(isFavorite: shoe.isFavorite, onTap: onFavoriteTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage({required this.shoe, required this.aspectRatio, this.width});

  final Shoe shoe;
  final double aspectRatio;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final color = _parseColor(shoe.colors.first);
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.15), color.withOpacity(0.05)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Center(
          child: Icon(Icons.directions_run, size: 48, color: color),
        ),
      ),
    );
  }

  Color _parseColor(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isFavorite, this.onTap});

  final bool isFavorite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface.withOpacity(0.9), shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? const Color(0xFFEF5350) : Theme.of(context).colorScheme.onSurface, size: 20),
        onPressed: onTap,
        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class _FavoriteChip extends StatelessWidget {
  const _FavoriteChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFEF5350).withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
      child: const Text('Favorite', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
    );
  }
}