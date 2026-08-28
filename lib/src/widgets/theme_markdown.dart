import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class ThemeMarkdown extends StatelessWidget {
  const ThemeMarkdown({
    super.key,
    required this.data,
    this.selectable = true,
    this.shrinkWrap = true,
    this.physics,
    this.padding,
  });

  final String data;
  final bool selectable;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final base = isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;

    final config = base.copy(configs: [
      PConfig(textStyle: TextStyle(fontSize: 16, color: scheme.onSurface)),
      LinkConfig(style: TextStyle(color: scheme.primary, decoration: TextDecoration.underline)),
    ]);

    return MarkdownWidget(
      data: data,
      selectable: selectable,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.zero,
      config: config,
    );
  }
}
