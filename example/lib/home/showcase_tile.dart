import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class ShowcaseTile extends StatelessWidget {
  const ShowcaseTile({super.key, required this.title, required this.child, this.description});

  final String title;
  final String? description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText(title, ThemeFont.inter, ThemeFontSize.size16, weight: FontWeight.w700),
          if (description != null) ...[
            const SizedBox(height: 2),
            ThemeText(description!, ThemeFont.lato, ThemeFontSize.size12),
          ],
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: children,
    );
  }
}
