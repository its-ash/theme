import 'package:flutter/material.dart';

class ThemeCarousel extends StatelessWidget {
  const ThemeCarousel({
    super.key,
    required this.children,
    this.itemExtent = 300,
    this.height = 180,
  });

  final List<Widget> children;
  final double itemExtent;

  /// CarouselView has no intrinsic height of its own — inside an
  /// unbounded-height ancestor (e.g. a ListView) it renders with zero
  /// height and disappears. This wraps it in a fixed-height SizedBox
  /// so it always has a valid layout size.
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CarouselView(itemExtent: itemExtent, children: children),
    );
  }
}
