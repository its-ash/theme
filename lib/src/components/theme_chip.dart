import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemeChip extends StatelessWidget {
  const ThemeChip({
    super.key,
    required this.label,
    this.avatar,
    this.onDeleted,
    this.selected,
    this.onSelected,
  });

  final String label;
  final Widget? avatar;
  final VoidCallback? onDeleted;
  final bool? selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    if (selected != null && onSelected != null) {
      return ChoiceChip(
        label: Text(label),
        avatar: avatar,
        selected: selected!,
        onSelected: onSelected,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }
    return Chip(
      label: Text(label),
      avatar: avatar,
      onDeleted: onDeleted,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class ThemeChipButton extends StatelessWidget {
  const ThemeChipButton(this.label, this.onTap, {super.key, this.selected = false});

  final String label;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      type: MaterialType.transparency,
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? colorScheme.primary : colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: selected ? colorScheme.primary : Theme.of(context).dividerColor,
            ),
          ),
          child: Text(
            label,
            style: AppTypography.labelLarge.copyWith(
              color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
