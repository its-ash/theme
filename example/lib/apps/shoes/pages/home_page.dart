import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/badges.dart';
import '/apps/shoes/components/shoe_card.dart';
import '/models/shoe_model.dart';
import '/models/shoe_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onShoeTap,
    required this.onViewAll,
  });

  final ValueChanged<Shoe> onShoeTap;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final banners = [
      const ThemeBannerCarouselItem(
        title: 'Summer Sale',
        subtitle: 'Up to 50% off on running shoes',
        ctaLabel: 'Shop Now',
        colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
      ),
      const ThemeBannerCarouselItem(
        title: 'New Arrivals',
        subtitle: 'Check out the latest drops',
        ctaLabel: 'Explore',
        colors: [Color(0xFF03DAC6), Color(0xFF00897B)],
      ),
      const ThemeBannerCarouselItem(
        title: 'Trail Ready',
        subtitle: 'Conquer any terrain',
        ctaLabel: 'Discover',
        colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            CategoryPill(
              label: 'All',
              icon: Icons.grid_view,
              isSelected: true,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        ThemeBannerCarousel(banners: banners),
        const SizedBox(height: 24),
        ThemeSectionHeader(
          title: 'Featured',
          subtitle: 'Handpicked for you',
          onAction: onViewAll,
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemCount: ShoeData.featured.length,
          itemBuilder: (context, i) => ShoeCard(
            shoe: ShoeData.featured[i],
            variant: ShoeCardVariant.grid,
            onTap: () => onShoeTap(ShoeData.featured[i]),
          ),
        ),
        const SizedBox(height: 24),
        ThemeSectionHeader(
          title: 'On Sale',
          subtitle: 'Limited time offers',
          onAction: onViewAll,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ShoeData.onSale.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ShoeCard(
                shoe: ShoeData.onSale[i],
                variant: ShoeCardVariant.horizontal,
                onTap: () => onShoeTap(ShoeData.onSale[i]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ThemeSectionHeader(
          title: 'Top Rated',
          subtitle: 'Loved by runners',
          onAction: onViewAll,
        ),
        const SizedBox(height: 12),
        ...ShoeData.shoes
            .where((s) => s.rating >= 4.7)
            .map(
              (shoe) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ShoeCard(
                  shoe: shoe,
                  variant: ShoeCardVariant.list,
                  onTap: () => onShoeTap(shoe),
                ),
              ),
            ),
      ],
    );
  }
}
