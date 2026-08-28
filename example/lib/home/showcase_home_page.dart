import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'section_data.dart';
import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/commerce_section.dart';
import 'sections/feedback_section.dart';
import 'sections/forms_section.dart';
import 'sections/inputs_section.dart';
import 'sections/layout_section.dart';
import 'sections/lists_section.dart';
import 'sections/navigation_section.dart';
import 'sections/pickers_section.dart';
import 'sections/states_section.dart';
import 'sections/theme_styles_section.dart';
import 'sections/typography_section.dart';
import '../theme_controller/theme_controller.dart';

class ShowcaseHomePage extends StatefulWidget {
  const ShowcaseHomePage({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

class _ShowcaseHomePageState extends State<ShowcaseHomePage> {
  int _selectedIndex = 0;

  List<ShowcaseSection> get _sections => [
    ShowcaseSection(label: 'Theme styles', icon: Icons.palette_outlined, builder: (context) => ThemeStylesSection(controller: widget.themeController)),
    ShowcaseSection(label: 'Buttons', icon: Icons.smart_button_outlined, builder: _buttons),
    ShowcaseSection(label: 'Cards & surfaces', icon: Icons.crop_square_outlined, builder: _cards),
    ShowcaseSection(label: 'Feedback', icon: Icons.notifications_active_outlined, builder: _feedback),
    ShowcaseSection(label: 'Navigation', icon: Icons.menu_outlined, builder: _navigation),
    ShowcaseSection(label: 'Inputs & selection', icon: Icons.tune_outlined, builder: _inputs),
    ShowcaseSection(label: 'Lists & data', icon: Icons.view_list_outlined, builder: _lists),
    ShowcaseSection(label: 'Pickers & menus', icon: Icons.calendar_today_outlined, builder: _pickers),
    ShowcaseSection(label: 'Layout & misc', icon: Icons.dashboard_customize_outlined, builder: _layout),
    ShowcaseSection(label: 'Typography', icon: Icons.text_fields_outlined, builder: _typography),
    ShowcaseSection(label: 'E-commerce widgets', icon: Icons.shopping_bag_outlined, builder: _commerce),
    ShowcaseSection(label: 'State & status', icon: Icons.hourglass_empty_outlined, builder: _states),
    ShowcaseSection(label: 'Form helpers', icon: Icons.edit_note_outlined, builder: _forms),
  ];

  static Widget _buttons(BuildContext _) => const ButtonsSection();
  static Widget _cards(BuildContext _) => const CardsSection();
  static Widget _feedback(BuildContext _) => const FeedbackSection();
  static Widget _navigation(BuildContext _) => const NavigationSection();
  static Widget _inputs(BuildContext _) => const InputsSection();
  static Widget _lists(BuildContext _) => const ListsSection();
  static Widget _pickers(BuildContext _) => const PickersSection();
  static Widget _layout(BuildContext _) => const LayoutSection();
  static Widget _typography(BuildContext _) => const TypographySection();
  static Widget _commerce(BuildContext _) => const CommerceSection();
  static Widget _states(BuildContext _) => const StatesSection();
  static Widget _forms(BuildContext _) => const FormsSection();

  void _select(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    final section = _sections[_selectedIndex];

    final content = _sections[_selectedIndex].builder(context);

    if (isWide) {
      return Scaffold(
        appBar: ThemeAppBar(
          title: 'Theme Showcase — ${section.label}',
          actions: [_ThemeModeMenu(controller: widget.themeController)],
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _select,
              labelType: NavigationRailLabelType.all,
              destinations: [
                for (final s in _sections)
                  NavigationRailDestination(icon: Icon(s.icon), label: Text(s.label)),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: content),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: ThemeAppBar(
        title: section.label,
        actions: [_ThemeModeMenu(controller: widget.themeController)],
      ),
      drawer: ThemeDrawer(
        children: [
          const DrawerHeader(
            child: ThemeText('Theme Showcase', ThemeFont.inter, ThemeFontSize.size20, weight: FontWeight.w700),
          ),
          for (var i = 0; i < _sections.length; i++)
            ThemeListTile(
              leading: Icon(_sections[i].icon),
              title: _sections[i].label,
              selected: i == _selectedIndex,
              onTap: () {
                Navigator.pop(context);
                _select(i);
              },
            ),
        ],
      ),
      body: content,
    );
  }
}

class _ThemeModeMenu extends StatelessWidget {
  const _ThemeModeMenu({required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeControllerState>(
      valueListenable: controller,
      builder: (context, state, _) {
        return ThemePopupMenu<ThemeMode>(
          icon: Icon(switch (state.mode) {
            ThemeMode.light => Icons.light_mode_outlined,
            ThemeMode.dark => Icons.dark_mode_outlined,
            ThemeMode.system => Icons.brightness_auto_outlined,
          }),
          onSelected: controller.setMode,
          items: const [
            PopupMenuItem(value: ThemeMode.light, child: Text('Light')),
            PopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
            PopupMenuItem(value: ThemeMode.system, child: Text('System')),
          ],
        );
      },
    );
  }
}
