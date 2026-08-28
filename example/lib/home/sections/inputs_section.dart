import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class InputsSection extends StatefulWidget {
  const InputsSection({super.key});

  @override
  State<InputsSection> createState() => _InputsSectionState();
}

class _InputsSectionState extends State<InputsSection> {
  int _filterIndex = 0;
  bool _chipSelected = false;
  bool _checkboxValue = true;
  int _radioValue = 0;
  bool _switchValue = true;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeTextField',
          child: const ThemeTextField(
            labelText: 'Email',
            hintText: 'you@example.com',
            prefixIcon: Icons.email_outlined,
          ),
        ),
        ShowcaseTile(
          title: 'ThemeSearchBar',
          child: ThemeSearchBar(onFilterTap: () {}),
        ),
        ShowcaseTile(
          title: 'ThemeFilterChipRow',
          child: ThemeFilterChipRow(
            chips: const ['All', 'New', 'Popular', 'Sale'],
            selectedIndex: _filterIndex,
            onSelected: (i) => setState(() => _filterIndex = i),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeChip / ThemeChipButton',
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ThemeChip(label: 'Deletable', onDeleted: () {}),
              ThemeChip(
                label: 'Selectable',
                selected: _chipSelected,
                onSelected: (v) => setState(() => _chipSelected = v),
              ),
              ThemeChipButton('Custom pill', () {}, selected: true),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeCheckbox / ThemeRadio / ThemeSwitch',
          child: Row(
            children: [
              ThemeCheckbox(value: _checkboxValue, onChanged: (v) => setState(() => _checkboxValue = v ?? false)),
              const SizedBox(width: 16),
              ThemeRadio<int>(value: 0, groupValue: _radioValue, onChanged: (v) => setState(() => _radioValue = v ?? 0)),
              ThemeRadio<int>(value: 1, groupValue: _radioValue, onChanged: (v) => setState(() => _radioValue = v ?? 0)),
              const SizedBox(width: 16),
              ThemeSwitch(value: _switchValue, onChanged: (v) => setState(() => _switchValue = v)),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeSlider',
          child: ThemeSlider(
            value: _sliderValue,
            onChanged: (v) => setState(() => _sliderValue = v),
            divisions: 10,
          ),
        ),
        ShowcaseTile(
          title: 'ThemeDropdown<T>',
          child: ThemeDropdown<String>(
            label: 'Category',
            hintText: 'Select one',
            items: const [
              DropdownMenuEntry(value: 'shoes', label: 'Shoes'),
              DropdownMenuEntry(value: 'apparel', label: 'Apparel'),
              DropdownMenuEntry(value: 'accessories', label: 'Accessories'),
            ],
            onSelected: (_) {},
          ),
        ),
      ],
    );
  }
}
