import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ThemeNavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        destinations: const [
          ThemeNavigationDestinationItem(icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
          ThemeNavigationDestinationItem(icon: Icons.search, selectedIcon: Icons.search, label: 'Search'),
          ThemeNavigationDestinationItem(icon: Icons.favorite_border, selectedIcon: Icons.favorite, label: 'Wishlist'),
          ThemeNavigationDestinationItem(icon: Icons.shopping_cart_outlined, selectedIcon: Icons.shopping_cart, label: 'Cart'),
          ThemeNavigationDestinationItem(icon: Icons.person_outline, selectedIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final items = <_DrawerItem>[
      const _DrawerItem(icon: Icons.home_outlined, label: 'Home', route: 'home'),
      const _DrawerItem(icon: Icons.category_outlined, label: 'Categories', route: 'categories'),
      const _DrawerItem(icon: Icons.receipt_long_outlined, label: 'Orders', route: 'orders'),
      const _DrawerItem(icon: Icons.favorite_border, label: 'Wishlist', route: 'wishlist'),
      const _DrawerItem(icon: Icons.local_offer_outlined, label: 'Offers', route: 'offers'),
      const _DrawerItem(icon: Icons.settings_outlined, label: 'Settings', route: 'settings'),
      const _DrawerItem(icon: Icons.help_outline, label: 'Help & Support', route: 'help'),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.primaryLight, AppColors.secondaryLight])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(radius: 32, backgroundColor: Colors.white, child: Icon(Icons.person, size: 36, color: AppColors.primaryLight)),
                const SizedBox(height: 12),
                Text('SneakerHead', style: AppTypography.titleLarge.copyWith(color: AppColors.onPrimaryLight)),
                Text('sneakerhead@example.com', style: AppTypography.bodyMedium.copyWith(color: AppColors.onPrimaryLight.withOpacity(0.8))),
              ],
            ),
          ),
          ...items.map((item) => ThemeListTile(
                leading: Icon(item.icon),
                title: item.label,
                onTap: () { Navigator.pop(context); onNavigate(item.route); },
              )),
          const ThemeDivider(),
          ThemeListTile(
            leading: const Icon(Icons.apps),
            title: 'Switch App',
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          ),
          const ThemeDivider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFEF5350)),
            title: Text('Logout', style: AppTypography.bodyLarge.copyWith(color: const Color(0xFFEF5350))),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  const _DrawerItem({required this.icon, required this.label, required this.route});
  final IconData icon;
  final String label;
  final String route;
}
