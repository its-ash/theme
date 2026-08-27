import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/order_card.dart';
import '/models/shoe_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const ProfileAvatar(radius: 40, initials: 'AR', showEditBadge: true),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Alex Runner', style: AppTypography.titleLarge), Text('alex@example.com', style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)))]),
            const Spacer(),
            ThemeIconButton(icon: Icons.chevron_right, onPressed: () {}),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _StatCard(label: 'Orders', value: '${ShoeData.orders.length}', icon: Icons.receipt_long_outlined),
            const SizedBox(width: 12),
            _StatCard(label: 'Wishlist', value: '${ShoeData.shoes.where((s) => s.isFavorite).length}', icon: Icons.favorite),
            const SizedBox(width: 12),
            _StatCard(label: 'Points', value: '1.2K', icon: Icons.stars),
          ],
        ),
        const SizedBox(height: 24),
        ThemeSectionHeader(title: 'Recent Orders'),
        const SizedBox(height: 12),
        ...ShoeData.orders.map((order) => OrderCard(order: order, onTap: () {}, onTrack: () {})),
        const SizedBox(height: 24),
        _MenuTile(icon: Icons.person_outline, title: 'Account Settings', onTap: () {}),
        _MenuTile(icon: Icons.location_on_outlined, title: 'Addresses', onTap: () {}),
        _MenuTile(icon: Icons.payment, title: 'Payment Methods', onTap: () {}),
        _MenuTile(icon: Icons.notifications_outlined, title: 'Notifications', onTap: () {}),
        _MenuTile(icon: Icons.help_outline, title: 'Help & Support', onTap: () {}),
        _MenuTile(icon: Icons.info_outline, title: 'About', onTap: () {}),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => Notify.info(context, 'Logged out'),
          icon: const Icon(Icons.logout, color: Color(0xFFEF5350)),
          label: const Text('Logout', style: TextStyle(color: Color(0xFFEF5350))),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ThemeCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [Icon(icon, color: Theme.of(context).colorScheme.primary), const SizedBox(height: 8), Text(value, style: AppTypography.titleLarge), Text(label, style: AppTypography.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)))]),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      child: ThemeListTile(leading: Icon(icon), title: title, trailing: const Icon(Icons.chevron_right), onTap: onTap),
    );
  }
}
