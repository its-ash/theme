import 'package:flutter/material.dart';

import 'package:theme/src/widgets/theme_lazy_image.dart';

class ThemeGallery extends StatelessWidget {
  const ThemeGallery({
    super.key,
    required this.sources,
    this.crossAxisCount = 3,
    this.spacing = 4,
    this.borderRadius = 8,
  });

  final List<Object> sources;
  final int crossAxisCount;
  final double spacing;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sources.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      itemBuilder: (context, index) {
        final tag = 'theme-gallery-${identityHashCode(sources)}-$index';
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              barrierColor: Colors.black,
              pageBuilder: (context, animation, __) => FadeTransition(
                opacity: animation,
                child: _ThemeGalleryPager(sources: sources, initialIndex: index, tagPrefix: 'theme-gallery-${identityHashCode(sources)}'),
              ),
            ),
          ),
          child: Hero(
            tag: tag,
            child: ThemeLazyImage(
              src: sources[index],
              fit: BoxFit.cover,
              borderRadius: borderRadius,
            ),
          ),
        );
      },
    );
  }
}

class _ThemeGalleryPager extends StatefulWidget {
  const _ThemeGalleryPager({
    required this.sources,
    required this.initialIndex,
    required this.tagPrefix,
  });

  final List<Object> sources;
  final int initialIndex;
  final String tagPrefix;

  @override
  State<_ThemeGalleryPager> createState() => _ThemeGalleryPagerState();
}

class _ThemeGalleryPagerState extends State<_ThemeGalleryPager> {
  late final PageController _controller = PageController(initialPage: widget.initialIndex);
  late int _index = widget.initialIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${_index + 1} / ${widget.sources.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.sources.length,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (context, i) {
          return Hero(
            tag: '${widget.tagPrefix}-$i',
            // ThemeLazyImage sizes itself from width/height rather than
            // filling its parent, so it needs the page's own bounds
            // explicitly — otherwise it collapses to a tiny box that
            // InteractiveViewer/Center just anchor top-left.
            child: LayoutBuilder(
              builder: (context, constraints) {
                return InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Center(
                    child: ThemeLazyImage(
                      src: widget.sources[i],
                      fit: BoxFit.contain,
                      borderRadius: 0,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
