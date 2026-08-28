import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ThemeLazyImage extends StatefulWidget {
  const ThemeLazyImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius = 12,
    this.cacheWidth,
    this.cacheHeight,
    this.fadeDuration = const Duration(milliseconds: 300),
  });

  final Object src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double borderRadius;
  final int? cacheWidth;
  final int? cacheHeight;
  final Duration fadeDuration;

  @override
  State<ThemeLazyImage> createState() => _ThemeLazyImageState();
}

class _ThemeLazyImageState extends State<ThemeLazyImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fade = AnimationController(
    vsync: this,
    duration: widget.fadeDuration,
  );
  bool _errored = false;
  bool _loaded = false;

  @override
  void dispose() {
    _fade.dispose();
    super.dispose();
  }

  ImageProvider _provider() {
    final s = widget.src;
    final base = switch (s) {
      String() when s.startsWith('http') => NetworkImage(s),
      String() => AssetImage(s) as ImageProvider,
      _ => MemoryImage(s as Uint8List),
    };
    // ResizeImage asserts at least one dimension is set — only wrap when the
    // caller actually opted into cache-size downscaling.
    if (widget.cacheWidth == null && widget.cacheHeight == null) return base;
    return ResizeImage(base, width: widget.cacheWidth, height: widget.cacheHeight);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final placeholder = widget.placeholder ??
        Container(
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );

    if (_errored) {
      return widget.errorWidget ??
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(
              width: widget.width,
              height: widget.height,
              color: scheme.surfaceContainerHigh,
              child: Icon(Icons.broken_image_outlined, color: scheme.outline),
            ),
          );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            if (!_loaded) placeholder,
            FadeTransition(
              opacity: _fade,
              child: Image(
                image: _provider(),
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    if (!_loaded) {
                      _loaded = true;
                      _fade.forward();
                    }
                    return child;
                  }
                  return placeholder;
                },
                errorBuilder: (_, __, ___) {
                  if (!_errored) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _errored = true);
                    });
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}