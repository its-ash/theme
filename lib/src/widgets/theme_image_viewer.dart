import 'package:flutter/material.dart';

import 'package:theme/src/widgets/theme_lazy_image.dart';

class ThemeImageViewer extends StatelessWidget {
  const ThemeImageViewer({
    super.key,
    required this.src,
    this.heroTag,
    this.minScale = 1,
    this.maxScale = 4,
  });

  final Object src;
  final Object? heroTag;
  final double minScale;
  final double maxScale;

  /// Opens the viewer as a full-screen route over a black background.
  static Future<void> show(
    BuildContext context, {
    required Object src,
    Object? heroTag,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (context, animation, __) => FadeTransition(
          opacity: animation,
          child: ThemeImageViewer(src: src, heroTag: heroTag),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = InteractiveViewer(
      minScale: minScale,
      maxScale: maxScale,
      child: Center(
        child: ThemeLazyImage(src: src, fit: BoxFit.contain, borderRadius: 0),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: heroTag != null ? Hero(tag: heroTag!, child: image) : image,
      ),
    );
  }
}
