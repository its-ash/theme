import 'package:flutter/material.dart';

class ThemeScrollbar extends StatefulWidget {
  const ThemeScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility = true,
  });

  final Widget child;
  final ScrollController? controller;
  final bool thumbVisibility;

  @override
  State<ThemeScrollbar> createState() => _ThemeScrollbarState();
}

class _ThemeScrollbarState extends State<ThemeScrollbar> {
  late final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? _controller;
    return Scrollbar(
      controller: controller,
      thumbVisibility: widget.thumbVisibility,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(scrollbars: false),
        child: PrimaryScrollController(
          controller: controller,
          child: widget.child,
        ),
      ),
    );
  }
}
