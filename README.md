# theme

Shared Flutter theming and component library: one `ThemeData` (light + dark), consistent colors/typography/shadows, and a `ThemeX` widget library so every app that uses this package looks and behaves consistently out of the box.

See **[COMPONENTS.md](COMPONENTS.md)** for the full component reference — every exported widget, its constructor, and a usage snippet.

## Install

This package isn't published to pub.dev — pull it in as a git dependency.

```yaml
dependencies:
  theme:
    git:
      url: https://github.com/ashvinijangid/theme.git
      ref: main   # or pin to a tag, e.g. v0.0.1
```

Then:

```bash
flutter pub get
```

To pin to a specific commit or tag instead of tracking `main`, set `ref` to that commit SHA or tag name.

## Usage

Wrap your app root with the theme:

```dart
import 'package:theme/theme.dart';

MaterialApp(
  theme: AppTheme.lightTheme(),
  darkTheme: AppTheme.darkTheme(),
  themeMode: ThemeMode.system,
  home: const HomePage(),
);
```

Every `ThemeX` widget then automatically picks up colors and typography from `Theme.of(context)` — no per-widget setup needed:

```dart
ThemeButton(label: 'Checkout', onPressed: () {});
Notify.success(context, 'Order placed successfully');
AddToCartButton(onPressed: () => Notify.success(context, 'Added to cart'));
ProfileAvatar(radius: 40, initials: 'AR', showEditBadge: true);
```

To rebrand for a specific app without touching any component, pass a custom `ColorScheme`:

```dart
AppTheme.lightTheme(colorScheme: myColorScheme)
```

## What's included

- **Theming**: `AppTheme` (light/dark `ThemeData` factories), `AppColors`, `AppTypography`, `AppShadowTheme`.
- **Component library**: buttons, cards, navigation (app bar, bottom nav, nav rail, drawer, tabs), inputs (text field, search, dropdown, chips, checkbox/radio/switch/slider), lists, pickers (date/time), and feedback (`Notify`, snackbar, banner, dialog, bottom sheet, progress indicator).
- **App-level widgets**: `AddToCartButton`, `PriceTag`, `RatingStars`, `ProfileAvatar`.

Full list with signatures: **[COMPONENTS.md](COMPONENTS.md)**.

## Explore the components

The `example/` app is a running showcase — it bundles several demo apps (an e-commerce app, a blog, an astrology app) all built entirely from this package's components.

```bash
cd example
flutter run
```

Or use the Makefile from the repo root:

```bash
make run     # flutter run for the example app
make deploy  # build + deploy
```

## Contributing

- All theme/component source lives in `lib/`. See `CLAUDE.md` for repo conventions.
- Preview and test any change against the `example` app before committing.
- Add new public widgets to `lib/src/widgets/` (or `lib/src/components/` for thin Material wrappers), export them from `lib/theme.dart`, and document them in `COMPONENTS.md`.

## License

MIT — see [LICENSE](LICENSE).
