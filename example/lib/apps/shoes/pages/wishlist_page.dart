import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/shoe_card.dart';
import '/models/shoe_model.dart';
import '/models/shoe_data.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key, required this.onShoeTap, required this.onBrowse});

  final ValueChanged<Shoe> onShoeTap;
  final VoidCallback onBrowse;

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Shoe> _wishlist = ShoeData.shoes.where((s) => s.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return _wishlist.isEmpty
        ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.favorite_border, size: 64, color: Color(0xFFBDBDBD)), const SizedBox(height: 16), Text('No favorites yet', style: AppTypography.titleMedium), const SizedBox(height: 8), ThemeButton(label: 'Browse Shoes', onPressed: widget.onBrowse)]))
        : GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.6),
            itemCount: _wishlist.length,
            itemBuilder: (context, i) => ShoeCard(shoe: _wishlist[i], variant: ShoeCardVariant.grid, onTap: () => widget.onShoeTap(_wishlist[i]), onFavoriteTap: () => setState(() {
              _wishlist[i] = _wishlist[i].copyWith(isFavorite: false);
              _wishlist.removeAt(i);
            })),
          );
  }
}
