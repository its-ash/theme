import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class CommerceSection extends StatefulWidget {
  const CommerceSection({super.key});

  @override
  State<CommerceSection> createState() => _CommerceSectionState();
}

class _CommerceSectionState extends State<CommerceSection> {
  bool _wishlisted = false;
  final _permissions = const [
    ThemePermission(id: 'read', label: 'View orders', description: 'See order history and status', icon: Icons.visibility_outlined),
    ThemePermission(id: 'write', label: 'Manage orders', description: 'Edit or cancel orders', icon: Icons.edit_outlined),
    ThemePermission(id: 'admin', label: 'Admin access', description: 'Full account and billing control', icon: Icons.admin_panel_settings_outlined),
  ];
  Set<String> _selectedPermissions = {'read'};

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'AddToCartButton',
          description: 'filled | outlined | icon, with loading and in-cart states',
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AddToCartButton(onPressed: () => Notify.success(context, 'Added to cart')),
              AddToCartButton(onPressed: () {}, variant: AddToCartVariant.outlined),
              AddToCartButton(onPressed: () {}, variant: AddToCartVariant.icon),
              const AddToCartButton(onPressed: null, isLoading: true),
              const AddToCartButton(onPressed: null, isInCart: true),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'PriceTag',
          description: 'small | medium | large',
          child: Wrap(
            spacing: 20,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              PriceTag(price: 89.99, size: PriceTagSize.small),
              PriceTag(price: 89.99, originalPrice: 129.99, size: PriceTagSize.medium),
              PriceTag(price: 89.99, originalPrice: 129.99, size: PriceTagSize.large),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'RatingStars',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              RatingStars(rating: 4.5),
              SizedBox(height: 8),
              RatingStars(rating: 3, showNumber: false, size: 22),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ProfileAvatar',
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const ProfileAvatar(initials: 'AR', radius: 28),
              ProfileAvatar(initials: 'JD', radius: 28, showEditBadge: true, onTap: () {}),
              const ProfileAvatar(radius: 28),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeDiscountBadge',
          child: const Wrap(
            spacing: 12,
            children: [
              ThemeDiscountBadge(percentOff: 20),
              ThemeDiscountBadge(percentOff: 50),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeWishlistButton',
          child: ThemeWishlistButton(
            isWishlisted: _wishlisted,
            onChanged: (v) => setState(() => _wishlisted = v),
          ),
        ),
        ShowcaseTile(
          title: 'ThemePermissionSelector',
          child: ThemePermissionSelector(
            permissions: _permissions,
            selectedIds: _selectedPermissions,
            onChanged: (v) => setState(() => _selectedPermissions = v),
          ),
        ),
      ],
    );
  }
}
