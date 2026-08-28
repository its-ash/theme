import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

const _sampleImages = [
  'https://picsum.photos/id/10/600/400',
  'https://picsum.photos/id/20/600/400',
  'https://picsum.photos/id/30/600/400',
  'https://picsum.photos/id/40/600/400',
  'https://picsum.photos/id/50/600/400',
  'https://picsum.photos/id/60/600/400',
];

const _sampleMarkdown = '''
# Release notes

**v2.1.0** adds dark-mode-aware shadows and 30+ new widgets.

- Fixed dropdown padding
- Added `ThemeMarkdown`, `ThemeVideoPlayer`, `ThemeGallery`
- See the [changelog](https://example.com) for the full list

```dart
ThemeButton(label: 'Ship it', onPressed: () {});
```
''';

class MediaSection extends StatelessWidget {
  const MediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeLazyImage',
          description: 'Fade-in network image with placeholder + error fallback',
          child: SizedBox(
            width: 160,
            height: 120,
            child: ThemeLazyImage(src: _sampleImages[0]),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeImageViewer',
          description: 'Tap to open a full-screen pinch-to-zoom viewer',
          child: GestureDetector(
            onTap: () => ThemeImageViewer.show(context, src: _sampleImages[1]),
            child: SizedBox(
              width: 160,
              height: 120,
              child: ThemeLazyImage(src: _sampleImages[1]),
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeGallery',
          description: 'Grid that opens a swipeable full-screen pager on tap',
          child: const SizedBox(
            height: 220,
            child: ThemeGallery(sources: _sampleImages, crossAxisCount: 3),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeVideoPlayer',
          child: const ThemeVideoPlayer(
            source: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            aspectRatio: 16 / 9,
          ),
        ),
        ShowcaseTile(
          title: 'ThemeMarkdown',
          child: const ThemeMarkdown(data: _sampleMarkdown),
        ),
        ShowcaseTile(
          title: 'ThemeCodeBlock',
          child: const ThemeCodeBlock(
            language: 'dart',
            code: "ThemeButton(label: 'Checkout', onPressed: () {});",
          ),
        ),
        ShowcaseTile(
          title: 'ThemeExpandableText',
          description: 'Truncates past trimLines with a Show more / Show less toggle',
          child: const ThemeExpandableText(
            'This shared theme package ships buttons, cards, navigation, inputs, feedback, '
            'pickers, media widgets, and a full set of commerce and status components — all '
            'wired to a single ColorScheme and AppShadowTheme so switching brands or presets '
            'restyles every screen at once without touching individual widgets.',
            trimLines: 2,
          ),
        ),
      ],
    );
  }
}
