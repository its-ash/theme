import 'package:flutter/material.dart';

class ThemeShimmer extends StatefulWidget {
  const ThemeShimmer({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 8,
  });

  final double? width;
  final double height;
  final double borderRadius;

  @override
  State<ThemeShimmer> createState() => _ThemeShimmerState();
}

class _ThemeShimmerState extends State<ThemeShimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final base = scheme.onSurface.withValues(alpha: 0.08);
    final highlight = scheme.onSurface.withValues(alpha: 0.16);

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1 + _controller.value * 3, 0),
                  end: Alignment(_controller.value * 3, 0),
                  colors: [base, highlight, base],
                  stops: const [0.35, 0.5, 0.65],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ThemeShimmerList extends StatelessWidget {
  const ThemeShimmerList({
    super.key,
    this.itemCount = 6,
    this.itemHeight = 64,
    this.spacing = 12,
  });

  final int itemCount;
  final double itemHeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      separatorBuilder: (_, __) => SizedBox(height: spacing),
      itemBuilder: (_, __) => ThemeShimmer(width: double.infinity, height: itemHeight, borderRadius: 12),
    );
  }
}
