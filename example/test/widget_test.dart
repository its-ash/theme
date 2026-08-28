import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:theme_example/main.dart';

void main() {
  testWidgets('Showcase home renders and can navigate to Buttons section', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(ShowcaseRoot());
    await tester.pumpAndSettle();

    expect(find.textContaining('Theme styles'), findsWidgets);

    await tester.tap(find.text('Buttons').first);
    await tester.pumpAndSettle();

    expect(find.text('ThemeButton'), findsOneWidget);
  });
}
