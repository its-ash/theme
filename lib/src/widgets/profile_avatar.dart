import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon = Icons.person,
    this.radius = 20,
    this.backgroundColor,
    this.onTap,
    this.showEditBadge = false,
  });

  final String? imageUrl;
  final String? initials;
  final IconData icon;
  final double radius;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool showEditBadge;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? scheme.primaryContainer,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl != null
          ? null
          : (initials != null
              ? Text(
                  initials!,
                  style: TextStyle(
                    color: scheme.onPrimaryContainer,
                    fontSize: radius * 0.7,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Icon(icon, size: radius, color: scheme.onPrimaryContainer)),
    );

    if (showEditBadge) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: scheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: scheme.surface, width: 2),
              ),
              child: Icon(Icons.edit, size: radius * 0.35, color: scheme.onPrimary),
            ),
          ),
        ],
      );
    }

    if (onTap == null) return avatar;

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: avatar,
    );
  }
}
