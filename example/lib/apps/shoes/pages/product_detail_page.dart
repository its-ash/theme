import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/product_bottom_sheet.dart';
import '/apps/shoes/components/shoe_card.dart';
import '/apps/shoes/components/badges.dart';
import '/apps/shoes/components/size_color_selector.dart';
import '/models/shoe_model.dart';
import '/models/shoe_data.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.shoe,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  final Shoe shoe;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late String _selectedSize;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.shoe.sizes.first;
    _selectedColor = Color(
      int.parse('FF${widget.shoe.colors.first.replaceAll('#', '')}', radix: 16),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => ProductBottomSheet(
        shoe: widget.shoe,
        onAddToCart: widget.onAddToCart,
        onBuyNow: widget.onBuyNow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final relatedShoes = ShoeData.shoes
        .where((s) => s.brand == widget.shoe.brand && s.id != widget.shoe.id)
        .toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _selectedColor.withOpacity(0.3),
                      _selectedColor.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.directions_run,
                    size: 100,
                    color: _selectedColor,
                  ),
                ),
              ),
            ),
            actions: [
              ThemeIconButton(icon: Icons.favorite_border, onPressed: () {}),
              ThemeIconButton(icon: Icons.share, onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.shoe.brand,
                            style: AppTypography.bodyMedium.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            widget.shoe.name,
                            style: AppTypography.headlineSmall,
                          ),
                        ],
                      ),
                      DiscountBadge(
                        discountPercent: widget.shoe.isOnSale
                            ? ((1 -
                                          widget.shoe.price /
                                              widget.shoe.originalPrice!) *
                                      100)
                                  .round()
                            : 0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      RatingStars(rating: widget.shoe.rating),
                      const SizedBox(width: 8),
                      Text(
                        '(${widget.shoe.reviewCount} reviews)',
                        style: AppTypography.bodyMedium.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PriceTag(
                    price: widget.shoe.price,
                    originalPrice: widget.shoe.originalPrice,
                    size: PriceTagSize.large,
                  ),
                  const SizedBox(height: 24),
                  ThemeSectionHeader(title: 'Select Size'),
                  const SizedBox(height: 12),
                  ShoeSizeSelector(
                    sizes: widget.shoe.sizes,
                    selectedSize: _selectedSize,
                    onSelected: (s) => setState(() => _selectedSize = s),
                  ),
                  const SizedBox(height: 24),
                  ThemeSectionHeader(title: 'Select Color'),
                  const SizedBox(height: 12),
                  ShoeColorSelector(
                    colorOptions: widget.shoe.colors
                        .map(
                          (c) => Color(
                            int.parse('FF${c.replaceAll('#', '')}', radix: 16),
                          ),
                        )
                        .toList(),
                    selectedColor: _selectedColor,
                    onSelected: (c) => setState(() => _selectedColor = c),
                  ),
                  const SizedBox(height: 24),
                  ThemeSectionHeader(title: 'Description'),
                  const SizedBox(height: 8),
                  Text(
                    widget.shoe.description,
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ThemeSectionHeader(title: 'Features'),
                  const SizedBox(height: 12),
                  _FeaturesGrid(),
                  if (relatedShoes.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    ThemeSectionHeader(title: 'You May Also Like'),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: relatedShoes.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ShoeCard(
                            shoe: relatedShoes[i],
                            variant: ShoeCardVariant.horizontal,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _BottomBar(
        shoe: widget.shoe,
        onAddToCart: () {
          widget.onAddToCart();
          _showBottomSheet();
        },
        onBuyNow: widget.onBuyNow,
      ),
    );
  }
}

class _FeaturesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      children: const [
        _FeatureTile(
          icon: Icons.energy_savings_leaf,
          title: 'Eco-Friendly',
          subtitle: 'Made from recycled materials',
        ),
        _FeatureTile(
          icon: Icons.water_drop,
          title: 'Waterproof',
          subtitle: 'Gore-Tex membrane',
        ),
        _FeatureTile(
          icon: Icons.speed,
          title: 'Lightweight',
          subtitle: 'Only 250g per shoe',
        ),
        _FeatureTile(
          icon: Icons.verified,
          title: '2-Year Warranty',
          subtitle: 'Manufacturer covered',
        ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: AppTypography.labelLarge),
                  Text(
                    subtitle,
                    style: AppTypography.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 11,
                    ),
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

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.shoe,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  final Shoe shoe;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
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
