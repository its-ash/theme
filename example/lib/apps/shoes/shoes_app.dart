import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/models/shoe_model.dart';
import '/apps/shoes/pages/home_page.dart';
import '/apps/shoes/pages/search_page.dart';
import '/apps/shoes/pages/wishlist_page.dart';
import '/apps/shoes/pages/cart_page.dart';
import '/apps/shoes/pages/profile_page.dart';
import '/apps/shoes/pages/product_detail_page.dart';
import '/apps/shoes/pages/checkout_page.dart';
import '/apps/shoes/pages/order_confirmation_page.dart';
import 'components/app_navigation.dart';

class ShoesApp extends StatelessWidget {
  const ShoesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SneakerHead',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentIndex = 0;

  static const _titles = ['SneakerHead', 'Search', 'Wishlist', 'Cart', 'Profile'];

  void _navTo(int index) => setState(() => _currentIndex = index);

  void _openProduct(Shoe shoe) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
      shoe: shoe,
      onAddToCart: () => Notify.success(context, '${shoe.name} added to cart'),
      onBuyNow: () => Notify.info(context, 'Proceeding to checkout'),
    )));
  }

  void _openCheckout() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutPage(onNavTap: (_) {}, onComplete: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderConfirmationPage(onContinue: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        _navTo(0);
      })));
    })));
  }

  List<Widget>? _actionsFor(int index) {
    return switch (index) {
      0 => [
          ThemeIconButton(icon: Icons.notifications_outlined, onPressed: () {}),
          ThemeIconButton(icon: Icons.search, onPressed: () => _navTo(1)),
        ],
      4 => [ThemeIconButton(icon: Icons.edit, onPressed: () {})],
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(title: _titles[_currentIndex], actions: _actionsFor(_currentIndex)),
      drawer: AppDrawer(
        onNavigate: (route) => _navTo(route == 'home' ? 0 : 1),
      ),
      body: IndexedStack(index: _currentIndex, children: [
        HomePage(onShoeTap: _openProduct, onViewAll: () => _navTo(1)),
        SearchPage(onShoeTap: _openProduct),
        WishlistPage(onShoeTap: _openProduct, onBrowse: () => _navTo(0)),
        CartPage(onBrowse: () => _navTo(0), onCheckout: _openCheckout),
        const ProfilePage(),
      ]),
      bottomNavigationBar: AppBottomNavBar(currentIndex: _currentIndex, onTap: _navTo),
    );
  }
}
