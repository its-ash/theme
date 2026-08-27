import 'package:flutter/material.dart';

enum AddToCartVariant { filled, outlined, icon }

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onPressed,
    this.label = 'Add to Cart',
    this.icon = Icons.shopping_cart_outlined,
    this.variant = AddToCartVariant.filled,
    this.isLoading = false,
    this.isInCart = false,
    this.inCartLabel = 'Added',
    this.expand = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final AddToCartVariant variant;
  final bool isLoading;
  final bool isInCart;
  final String inCartLabel;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final text = isInCart ? inCartLabel : label;
    final child = isLoading
        ? const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(text);

    final callback = isLoading ? null : onPressed;
    final leadingIcon = isInCart ? Icons.check : icon;

    Widget button = switch (variant) {
      AddToCartVariant.filled => isLoading
          ? FilledButton(onPressed: callback, child: child)
          : FilledButton.icon(
              onPressed: callback,
              icon: Icon(leadingIcon),
              label: child,
            ),
      AddToCartVariant.outlined => isLoading
          ? OutlinedButton(onPressed: callback, child: child)
          : OutlinedButton.icon(
              onPressed: callback,
              icon: Icon(leadingIcon),
              label: child,
            ),
      AddToCartVariant.icon => IconButton.filled(
          onPressed: callback,
          icon: isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(leadingIcon),
          tooltip: text,
        ),
    };

    if (expand && variant != AddToCartVariant.icon) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
