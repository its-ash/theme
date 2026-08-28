import 'package:flutter/material.dart';

import 'package:theme/src/widgets/theme_lazy_image.dart';

/// A pinch-to-zoom, pannable image that fits [src] to the available space
/// without letterbox dead space in the pan bounds.
///
/// `ThemeLazyImage` sizes itself from `width`/`height` rather than filling
/// its parent, so a bare `InteractiveViewer(child: ThemeLazyImage(...))`
/// collapses to a tiny box. This wraps it in a `ConstrainedBox` (bounding
/// the available space) + `FittedBox` (measuring the unsized image at its
/// own intrinsic size, then scaling that box to fit) so
/// `InteractiveViewer`'s pannable bounds are exactly the image's contained
/// size — not the full viewport, which would let users pan into empty
/// space around non-viewport-aspect-ratio images once zoomed in.
class ThemeZoomableImage extends StatelessWidget {
  const ThemeZoomableImage({
    super.key,
    required this.src,
    this.minScale = 1,
    this.maxScale = 4,
  });

  final Object src;
  final double minScale;
  final double maxScale;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InteractiveViewer(
          minScale: minScale,
          maxScale: maxScale,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth,
                maxHeight: constraints.maxHeight,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: ThemeLazyImage(src: src, borderRadius: 0),
              ),
            ),
          ),
        );
      },
    );
  }
}
