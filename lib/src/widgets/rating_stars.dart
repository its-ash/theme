import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showNumber = true,
    this.color = const Color(0xFFFFA726),
    this.starCount = 5,
  });

  final double rating;
  final double size;
  final bool showNumber;
  final Color color;
  final int starCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(
            starCount,
            (i) => Icon(
              i < rating.round() ? Icons.star : Icons.star_border,
              size: size,
              color: color,
            ),
          ),
        ),
        if (showNumber) ...[
          const SizedBox(width: 4),
          Text(rating.toStringAsFixed(1), style: AppTypography.labelLarge),
        ],
      ],
    );
  }
}
