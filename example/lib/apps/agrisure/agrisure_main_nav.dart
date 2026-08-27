import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'agrisure_cart_page.dart';
import 'agrisure_drawer.dart';
import 'agrisure_home_page.dart';
import 'agrisure_model.dart';
import 'agrisure_profile_page.dart';

class AgriSureMainNav extends StatefulWidget {
  const AgriSureMainNav({super.key});

  @override
  State<AgriSureMainNav> createState() => _AgriSureMainNavState();
}

class _AgriSureMainNavState extends State<AgriSureMainNav> {
  int _index = 0;
  final List<CartLine> _cart = [];

  static const _titles = ['AgriSure', 'Cart', 'Profile'];

  void _navTo(int index) => setState(() => _index = index);

  void _addToCart(Seed seed) {
    setState(() {
      final existing = _cart.indexWhere((line) => line.seed.name == seed.name);
      if (existing >= 0) {
        _cart[existing].quantity++;
      } else {
        _cart.add(CartLine(seed: seed));
      }
    });
  }

  void _updateQuantity(int index, int quantity) {
    setState(() {
      if (quantity <= 0) {
        _cart.removeAt(index);
      } else {
        _cart[index].quantity = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(title: _titles[_index]),
      drawer: AgriSureDrawer(onNavigate: _navTo),
      body: IndexedStack(
        index: _index,
        children: [
          AgriSureHomePage(onAddToCart: _addToCart),
          AgriSureCartPage(
            cart: _cart,
            onUpdateQuantity: _updateQuantity,
            onCheckout: () => setState(_cart.clear),
          ),
          const AgriSureProfilePage(),
        ],
      ),
      bottomNavigationBar: ThemeNavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _navTo,
        destinations: const [
          ThemeNavigationDestinationItem(icon: Icons.storefront_outlined, selectedIcon: Icons.storefront, label: 'Shop'),
          ThemeNavigationDestinationItem(icon: Icons.shopping_cart_outlined, selectedIcon: Icons.shopping_cart, label: 'Cart'),
          ThemeNavigationDestinationItem(icon: Icons.person_outline, selectedIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }
}
