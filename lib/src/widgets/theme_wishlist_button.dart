import 'package:flutter/material.dart';

class ThemeWishlistButton extends StatelessWidget {
  const ThemeWishlistButton({
    super.key,
    required this.isWishlisted,
    this.onChanged,
    this.size = 24,
    this.filledColor,
  });

  final bool isWishlisted;
  final ValueChanged<bool>? onChanged;
  final double size;
  final Color? filledColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = filledColor ?? Colors.red.shade400;

    return IconButton(
      onPressed: () => onChanged?.call(!isWishlisted),
      tooltip: isWishlisted ? 'Remove from wishlist' : 'Add to wishlist',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: Icon(
          isWishlisted ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(isWishlisted),
          size: size,
          color: isWishlisted ? color : scheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
