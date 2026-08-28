import 'package:flutter/material.dart';

class ThemeExpandableText extends StatefulWidget {
  const ThemeExpandableText(
    this.text, {
    super.key,
    this.trimLines = 3,
    this.style,
    this.expandLabel = 'Show more',
    this.collapseLabel = 'Show less',
  });

  final String text;
  final int trimLines;
  final TextStyle? style;
  final String expandLabel;
  final String collapseLabel;

  @override
  State<ThemeExpandableText> createState() => _ThemeExpandableTextState();
}

class _ThemeExpandableTextState extends State<ThemeExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = widget.style ?? DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: style);
        final painter = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: Directionality.of(context),
        )..layout(maxWidth: constraints.maxWidth);

        if (!painter.didExceedMaxLines) {
          return Text(widget.text, style: style);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: style,
              maxLines: _expanded ? null : widget.trimLines,
              overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _expanded ? widget.collapseLabel : widget.expandLabel,
                  style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
