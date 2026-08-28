import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemePermission {
  const ThemePermission({
    required this.id,
    required this.label,
    this.description,
    this.icon,
  });

  final String id;
  final String label;
  final String? description;
  final IconData? icon;
}

/// A list of togglable permissions (roles, feature flags, access scopes) —
/// each row is a `CheckboxListTile`-style switch driven by [selectedIds].
class ThemePermissionSelector extends StatelessWidget {
  const ThemePermissionSelector({
    super.key,
    required this.permissions,
    required this.selectedIds,
    this.onChanged,
  });

  final List<ThemePermission> permissions;
  final Set<String> selectedIds;
  final ValueChanged<Set<String>>? onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: permissions.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final permission = permissions[index];
        final checked = selectedIds.contains(permission.id);

        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: permission.icon != null
              ? Icon(permission.icon, color: scheme.onSurface.withValues(alpha: 0.7))
              : null,
          title: Text(permission.label, style: AppTypography.bodyLarge),
          subtitle: permission.description != null
              ? Text(
                  permission.description!,
                  style: AppTypography.bodyMedium.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.6),
                  ),
                )
              : null,
          value: checked,
          onChanged: (value) {
            final next = Set<String>.from(selectedIds);
            value ? next.add(permission.id) : next.remove(permission.id);
            onChanged?.call(next);
          },
        );
      },
    );
  }
}
