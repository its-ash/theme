import 'package:flutter/material.dart';

class ThemeDropdown<T> extends StatelessWidget {
  const ThemeDropdown({
    super.key,
    required this.items,
    this.initialSelection,
    this.onSelected,
    this.hintText,
    this.label,
  });

  final List<DropdownMenuEntry<T>> items;
  final T? initialSelection;
  final ValueChanged<T?>? onSelected;
  final String? hintText;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      dropdownMenuEntries: items,
      initialSelection: initialSelection,
      onSelected: onSelected,
      hintText: hintText,
      label: label != null ? Text(label!) : null,
    );
  }
}
