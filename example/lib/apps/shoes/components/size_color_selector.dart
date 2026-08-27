import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class ShoeSizeSelector extends StatelessWidget {
  const ShoeSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSelected,
  });

  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: sizes.map((size) {
        final isSelected = size == selectedSize;
        return ThemeTapButton(
          onTap: () => onSelected(size),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          size: const Size(48, 48),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryLight
                : Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryLight
                  : AppColors.borderLight,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            size,
            style: TextStyle(
              color: isSelected
                  ? AppColors.onPrimaryLight
                  : Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ShoeColorSelector extends StatelessWidget {
  const ShoeColorSelector({
    super.key,
    required this.colorOptions,
    required this.selectedColor,
    required this.onSelected,
  });

  final List<Color> colorOptions;
  final Color selectedColor;
  final ValueChanged<Color> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: colorOptions.map((color) {
        final isSelected = color == selectedColor;
        return ThemeTapButton(
          onTap: () => onSelected(color),
          shape: const CircleBorder(),
          size: const Size(40, 40),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? AppColors.onSurfaceLight : Colors.transparent,
              width: 2,
            ),
          ),
          child: isSelected
              ? Icon(
                  Icons.check,
                  size: 18,
                  color: color.computeLuminance() > 0.5
                      ? AppColors.onSurfaceLight
                      : AppColors.onPrimaryLight,
                )
              : null,
        );
      }).toList(),
    );
  }
}
