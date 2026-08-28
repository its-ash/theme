import 'package:flutter/material.dart';

class ThemeDiscountBadge extends StatelessWidget {
  const ThemeDiscountBadge({
    super.key,
    required this.percentOff,
    this.color,
  });

  /// e.g. `20` renders "-20%".
  final int percentOff;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = color ?? scheme.error;
    final fg = color == null ? scheme.onError : (bg.computeLuminance() > 0.5 ? Colors.black : Colors.white);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '-$percentOff%',
        style: TextStyle(
          color: fg,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
