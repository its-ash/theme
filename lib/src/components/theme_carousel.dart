import 'package:flutter/material.dart';

class ThemeCarousel extends StatelessWidget {
  const ThemeCarousel({super.key, required this.children, this.itemExtent = 300});

  final List<Widget> children;
  final double itemExtent;

  @override
  Widget build(BuildContext context) {
    return CarouselView(itemExtent: itemExtent, children: children);
  }
}
