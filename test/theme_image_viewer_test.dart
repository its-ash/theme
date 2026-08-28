import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme/theme.dart';

Future<Uint8List> _encode2x1RedPng() async {
  final pixels = Uint8List(2 * 1 * 4);
  for (var i = 0; i < pixels.length; i += 4) {
    pixels[i] = 255; // R
    pixels[i + 3] = 255; // A
  }
  final completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(pixels, 2, 1, ui.PixelFormat.rgba8888, completer.complete);
  final image = await completer.future;
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}

void main() {
  testWidgets('ThemeImageViewer sizes the image to its own aspect ratio, not the square viewport', (tester) async {
    tester.view.physicalSize = const Size(800, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.runAsync(() async {
      final pngBytes = await _encode2x1RedPng();

      await tester.pumpWidget(MaterialApp(
        home: ThemeImageViewer(src: pngBytes),
      ));
      // Real decode completes on a microtask/isolate hop beyond a plain
      // pump() — give it a chance before asserting on the laid-out size.
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await tester.pump();
      await tester.pump();
    });

    expect(tester.takeException(), isNull);
    expect(find.byIcon(Icons.broken_image_outlined), findsNothing);

    final renderObject = tester.renderObject(find.byType(FittedBox)) as RenderFittedBox;
    final child = renderObject.child as RenderBox;
    final childSize = child.size;

    // The 2x1 source should lay out its intrinsic box at that ~2:1 ratio
    // (before FittedBox scales it) — a square/viewport-stretched box would
    // be ~1:1 instead, which is the letterbox-in-pan-bounds bug this
    // structure (ConstrainedBox + FittedBox around an unsized
    // ThemeLazyImage) fixes.
    expect(childSize.width / childSize.height, greaterThan(1.5));
  });
}
