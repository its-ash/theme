import 'package:flutter/material.dart';

class ThemeColorPicker extends StatelessWidget {
  const ThemeColorPicker({
    super.key,
    required this.colors,
    this.selected,
    this.onSelected,
    this.swatchSize = 36,
    this.spacing = 10,
  });

  final List<Color> colors;
  final Color? selected;
  final ValueChanged<Color>? onSelected;
  final double swatchSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: [
        for (final color in colors)
          GestureDetector(
            onTap: () => onSelected?.call(color),
            child: Container(
              width: swatchSize,
              height: swatchSize,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: color == selected ? scheme.onSurface : Colors.transparent,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: color == selected
                  ? DecoratedBox(
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: scheme.surface, width: 2)),
                      child: Icon(
                        Icons.check,
                        size: swatchSize * 0.5,
                        color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                      ),
                    )
                  : null,
            ),
          ),
      ],
    );
  }
}
