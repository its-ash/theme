import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class ThemeSearchBar extends StatelessWidget {
  const ThemeSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.tune),
          onPressed: onFilterTap,
        ),
      ),
    );
  }
}

class ThemeFilterChipRow extends StatelessWidget {
  const ThemeFilterChipRow({
    super.key,
    required this.chips,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> chips;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ThemeChipButton(
            chips[index],
            () => onSelected(index),
            selected: index == selectedIndex,
          );
        },
      ),
    );
  }
}
