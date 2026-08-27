# theme — Component Reference

This file documents every public widget/API exported by the `theme` Flutter package (see `lib/theme.dart`). It exists so an LLM (or a developer) consuming this package can discover what's available and how to configure it without reading source.

Package import: `import 'package:theme/theme.dart';`

## Setup

Wrap your app with the theme. Do this once, at the `MaterialApp` root.

```dart
MaterialApp(
  theme: AppTheme.lightTheme(),
  darkTheme: AppTheme.darkTheme(),
  themeMode: ThemeMode.system,
)
```

`AppTheme.lightTheme({ColorScheme? colorScheme, TextTheme? textTheme, AppShadowTheme shadows})` and `AppTheme.darkTheme(...)` take the same optional overrides — pass a custom `ColorScheme` to rebrand without touching any component. Every widget below automatically picks up colors/typography from the nearest `Theme.of(context)`, so no per-widget theme wiring is needed.

Widgets are named `ThemeX` (e.g. `ThemeButton`) to avoid clashing with Flutter's own `Text`, `Card`, `Button`, etc. Everything is a `StatelessWidget` unless noted; static-method classes (`Notify`, `ThemeSnackBar`, `ThemeDialog`, `ThemeBottomSheet`, `ThemeDatePicker`, `ThemeTimePicker`, `ThemeBanner`) are called directly without instantiation.

---

## Index

- [Buttons & actions](#buttons--actions)
- [Cards & surfaces](#cards--surfaces)
- [Notifications & feedback](#notifications--feedback)
- [Navigation](#navigation)
- [Inputs & selection](#inputs--selection)
- [Lists & data](#lists--data)
- [Pickers & menus](#pickers--menus)
- [Layout & misc](#layout--misc)
- [Typography](#typography)
- [E-commerce / app widgets](#e-commerce--app-widgets)

---

## Buttons & actions

### `ThemeButton`
Standard button with 4 visual variants, optional icon.

```dart
ThemeButton({
  required String label,
  VoidCallback? onPressed,
  ThemeButtonVariant variant = ThemeButtonVariant.filled, // elevated | filled | outlined | text
  IconData? icon,
})
```
```dart
ThemeButton(label: 'Checkout', onPressed: () {}, variant: ThemeButtonVariant.filled, icon: Icons.arrow_forward)
```

### `ThemeIconButton`
```dart
ThemeIconButton({required IconData icon, VoidCallback? onPressed, String? tooltip})
```

### `ThemeTapButton`
Bare tap surface with ripple — for building custom-shaped tappable widgets (chips, cards, tiles) that need `InkWell` behavior without a specific button look.
```dart
ThemeTapButton({
  Widget? child,
  VoidCallback? onTap,
  ShapeBorder shape = const RoundedRectangleBorder(),
  Size? size,
  BoxDecoration? decoration,
  Duration duration = const Duration(milliseconds: 150),
})
```

### `ThemeFab`
Floating action button; becomes extended (pill + label) automatically when `label` is given.
```dart
ThemeFab({required IconData icon, VoidCallback? onPressed, String? label})
```

### `ThemeSegmentedButton<T>`
Thin wrapper over Flutter's `SegmentedButton`.
```dart
ThemeSegmentedButton<T>({
  required List<ButtonSegment<T>> segments,
  required Set<T> selected,
  required ValueChanged<Set<T>> onSelectionChanged,
})
```

### `ThemeToggleButtons`
```dart
ThemeToggleButtons({
  required List<Widget> children,
  required List<bool> isSelected,
  required ValueChanged<int> onPressed,
})
```

---

## Cards & surfaces

### `ThemeCard`
Elevated container with theme-aware shadow and rounded corners.
```dart
ThemeCard({
  required Widget child,
  Color? color,
  double borderRadius = 16,
  Clip clipBehavior = Clip.antiAlias,
  EdgeInsetsGeometry margin = const EdgeInsets.all(8),
})
```

### `ThemeDivider` / `ThemeVerticalDivider`
```dart
ThemeDivider({double? height, double? indent, double? endIndent})
ThemeVerticalDivider({double? width, double? indent, double? endIndent})
```

### `ThemeTooltip`
```dart
ThemeTooltip({required String message, required Widget child})
```

---

## Notifications & feedback

### `Notify` — the notification system
The single entry point for user-facing feedback. Shows a themed, floating `SnackBar` with an icon and color matched to the message type.

```dart
Notify.show(context, String message, {
  NotifyType type = NotifyType.info, // success | error | warning | info
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
})

// Shorthands
Notify.success(context, String message, {Duration? duration})
Notify.error(context, String message, {Duration? duration})
Notify.warning(context, String message, {Duration? duration})
Notify.info(context, String message, {Duration? duration})
```
```dart
Notify.success(context, 'Order placed successfully');
Notify.error(context, 'Payment failed, please try again');
```
Colors: success = green, error = `colorScheme.error`, warning = orange, info = `colorScheme.inverseSurface`. Requires a `Scaffold`/`ScaffoldMessenger` ancestor (standard Flutter requirement for SnackBars).

### `ThemeSnackBar`
Lower-level, unstyled snackbar (no type/color/icon) — use `Notify` instead unless you need a bare message.
```dart
ThemeSnackBar.show(BuildContext context, String message, {SnackBarAction? action})
```

### `ThemeBanner`
Persistent top-of-screen banner (Material `MaterialBanner`) for messages that need an explicit dismiss action, unlike a snackbar which auto-dismisses.
```dart
ThemeBanner.show(BuildContext context, {required String message, required List<Widget> actions})
ThemeBanner.hide(BuildContext context)
```

### `ThemeDialog`
```dart
ThemeDialog.show<T>(BuildContext context, {
  String? title,
  String? content,
  List<Widget>? actions,
  bool barrierDismissible = true,
}) // returns Future<T?>
```

### `ThemeBottomSheet`
```dart
ThemeBottomSheet.show<T>(BuildContext context, {
  required WidgetBuilder builder,
  bool isScrollControlled = false,
}) // returns Future<T?>
```

### `ThemeProgressIndicator`
```dart
ThemeProgressIndicator({
  ThemeProgressIndicatorType type = ThemeProgressIndicatorType.circular, // linear | circular
  double? value, // null = indeterminate
})
```

### `ThemeBadge`
Small label/dot overlay on a child widget (e.g. unread count on a bell icon).
```dart
ThemeBadge({required Widget child, String? label, bool isVisible = true})
```

---

## Navigation

### `ThemeAppBar`
```dart
ThemeAppBar({String? title, List<Widget>? actions, Widget? leading, bool? centerTitle})
```

### `ThemeBottomAppBar`
```dart
ThemeBottomAppBar({required List<Widget> children}) // laid out via spaceAround Row
```

### `ThemeBottomNavigationBar`
```dart
ThemeBottomNavigationBar({
  required List<BottomNavigationBarItem> items,
  required int currentIndex,
  required ValueChanged<int> onTap,
})
```

### `ThemeNavigationBar` + `ThemeNavigationDestinationItem`
Material 3 navigation bar (bottom, pill-indicator style).
```dart
ThemeNavigationDestinationItem({required IconData icon, IconData? selectedIcon, required String label})

ThemeNavigationBar({
  required List<ThemeNavigationDestinationItem> destinations,
  required int selectedIndex,
  required ValueChanged<int> onDestinationSelected,
})
```

### `ThemeNavigationRail`
Same `ThemeNavigationDestinationItem` list, for side-rail nav (tablet/desktop layouts).
```dart
ThemeNavigationRail({
  required List<ThemeNavigationDestinationItem> destinations,
  required int selectedIndex,
  required ValueChanged<int> onDestinationSelected,
  bool extended = false,
})
```

### `ThemeDrawer`
```dart
ThemeDrawer({required List<Widget> children})
```

### `ThemeTabBar`
Implements `PreferredSizeWidget` — use directly as a `Scaffold.appBar.bottom` or in a `TabBar` slot.
```dart
ThemeTabBar({required List<String> tabs, TabController? controller})
```

---

## Inputs & selection

### `ThemeTextField`
```dart
ThemeTextField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  String? errorText,
  bool obscureText = false,
  TextInputType? keyboardType,
  IconData? prefixIcon,
  IconData? suffixIcon,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
  bool enabled = true,
  int? maxLines = 1,
})
```

### `ThemeSearchBar`
```dart
ThemeSearchBar({
  TextEditingController? controller,
  String hintText = 'Search...',
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
  VoidCallback? onFilterTap, // shows a trailing tune/filter icon button
})
```

### `ThemeFilterChipRow`
Horizontal scrolling row of single-select filter chips.
```dart
ThemeFilterChipRow({
  required List<String> chips,
  required int selectedIndex,
  required ValueChanged<int> onSelected,
})
```

### `ThemeChip` / `ThemeChipButton`
```dart
// Chip or ChoiceChip depending on whether selected/onSelected are provided
ThemeChip({
  required String label,
  Widget? avatar,
  VoidCallback? onDeleted,   // -> renders as deletable Chip
  bool? selected,            // -> with onSelected, renders as ChoiceChip
  ValueChanged<bool>? onSelected,
})

// Custom pill-shaped tap target, used internally by ThemeFilterChipRow
ThemeChipButton(String label, VoidCallback? onTap, {bool selected = false})
```

### `ThemeCheckbox`
```dart
ThemeCheckbox({required bool value, ValueChanged<bool?>? onChanged})
```

### `ThemeRadio<T>`
```dart
ThemeRadio<T>({required T value, required T? groupValue, ValueChanged<T?>? onChanged})
```

### `ThemeSwitch`
```dart
ThemeSwitch({required bool value, ValueChanged<bool>? onChanged})
```

### `ThemeSlider`
```dart
ThemeSlider({
  required double value,
  ValueChanged<double>? onChanged,
  double min = 0,
  double max = 1,
  int? divisions,
})
```

### `ThemeDropdown<T>`
```dart
ThemeDropdown<T>({
  required List<DropdownMenuEntry<T>> items,
  T? initialSelection,
  ValueChanged<T?>? onSelected,
  String? hintText,
  String? label,
})
```

---

## Lists & data

### `ThemeListTile`
```dart
ThemeListTile({
  Widget? leading,
  required String title,
  String? subtitle,
  Widget? trailing,
  VoidCallback? onTap,
  bool selected = false,
})
```

### `ThemeExpansionTile`
```dart
ThemeExpansionTile({
  required String title,
  required List<Widget> children,
  Widget? leading,
  bool initiallyExpanded = false,
})
```

### `ThemeDataTable`
```dart
ThemeDataTable({required List<DataColumn> columns, required List<DataRow> rows})
```

### `ThemeScrollbar`
```dart
ThemeScrollbar({required Widget child, ScrollController? controller, bool thumbVisibility = true})
```

### `ThemeCarousel`
```dart
ThemeCarousel({required List<Widget> children, double itemExtent = 300})
```

---

## Pickers & menus

### `ThemeDatePicker`
```dart
ThemeDatePicker.show(BuildContext context, {
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? initialDate,
}) // returns Future<DateTime?>
```

### `ThemeTimePicker`
```dart
ThemeTimePicker.show(BuildContext context, {TimeOfDay? initialTime}) // returns Future<TimeOfDay?>
```

### `ThemePopupMenu<T>`
```dart
ThemePopupMenu<T>({
  required List<PopupMenuEntry<T>> items,
  ValueChanged<T>? onSelected,
  Widget? icon,
})
```

---

## Layout & misc

### `ThemeSectionHeader`
Title + optional subtitle + optional trailing "See all" action — the standard section header for list/grid sections on a home screen.
```dart
ThemeSectionHeader({
  required String title,
  String? subtitle,
  String actionLabel = 'See all',
  VoidCallback? onAction, // omit to hide the action button entirely
})
```

### `ThemeBannerCarousel` + `ThemeBannerCarouselItem`
Full-bleed swipeable promo/hero banners with gradient background and CTA pill.
```dart
ThemeBannerCarouselItem({
  required String title,
  required String subtitle,
  required String ctaLabel,
  required List<Color> colors, // gradient stops
})

ThemeBannerCarousel({
  required List<ThemeBannerCarouselItem> banners,
  ValueChanged<int>? onTap, // index of tapped banner
})
```

---

## Typography

### `ThemeText`
Direct font/size/weight control when you need something outside the standard `TextTheme` scale.
```dart
ThemeText(
  String text,
  ThemeFont font,       // ThemeFont.inter | ThemeFont.lato
  ThemeFontSize size,    // ThemeFontSize.size10 ... size56 (10,12,14,16,18,20,22,24,28,32,36,40,48,56)
  {
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? letterSpacing,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }
)
```
```dart
ThemeText('Featured', ThemeFont.inter, ThemeFontSize.size20, weight: FontWeight.w700)
```

### `AppTypography`
Static `TextStyle` getters matching the app's type scale — prefer these (or plain `Theme.of(context).textTheme`) over `ThemeText` for standard body/heading text: `headlineLarge`, `headlineMedium`, `headlineSmall`, `titleLarge`, `titleMedium`, `bodyLarge`, `bodyMedium`, `labelLarge`.
```dart
Text('Section title', style: AppTypography.titleLarge)
```

---

## E-commerce / app widgets

Higher-level, opinionated widgets for common product/commerce/profile screens. These compose the primitives above.

### `AddToCartButton`
Configurable add-to-cart CTA with loading and "already in cart" states built in.
```dart
AddToCartButton({
  required VoidCallback? onPressed,
  String label = 'Add to Cart',
  IconData icon = Icons.shopping_cart_outlined,
  AddToCartVariant variant = AddToCartVariant.filled, // filled | outlined | icon
  bool isLoading = false,   // shows a spinner, disables tap
  bool isInCart = false,    // swaps label/icon to a checkmark + inCartLabel
  String inCartLabel = 'Added',
  bool expand = false,      // stretch to fill available width (ignored for `icon` variant)
})
```
```dart
AddToCartButton(onPressed: () => Notify.success(context, 'Added to cart'), variant: AddToCartVariant.outlined)
```

### `PriceTag`
Price display with automatic strikethrough original price when on sale.
```dart
PriceTag({
  required double price,
  double? originalPrice,          // shown struck-through if greater than price
  PriceTagSize size = PriceTagSize.medium, // small | medium | large
  String currencySymbol = '\$',
})
```

### `RatingStars`
Star rating display (not interactive — for showing an average rating, not collecting one).
```dart
RatingStars({
  required double rating,     // rounded to nearest star for fill
  double size = 16,
  bool showNumber = true,     // append e.g. "4.5" after the stars
  Color color = const Color(0xFFFFA726),
  int starCount = 5,
})
```

### `ProfileAvatar`
User avatar with image/initials/icon fallback chain, optional tap and edit badge.
```dart
ProfileAvatar({
  String? imageUrl,           // network image if provided
  String? initials,           // else initials text if provided
  IconData icon = Icons.person, // else this icon as final fallback
  double radius = 20,
  Color? backgroundColor,     // defaults to colorScheme.primaryContainer
  VoidCallback? onTap,        // wraps in InkWell when provided
  bool showEditBadge = false, // small pencil badge, bottom-right
})
```
```dart
ProfileAvatar(radius: 40, initials: 'AR', showEditBadge: true, onTap: () => _editProfile())
```

---

## Colors & shadows (advanced / theming internals)

- `AppColors` — static light/dark palette constants and `lightColorScheme` / `darkColorScheme` getters. Pass a derived `ColorScheme` into `AppTheme.lightTheme(colorScheme: ...)` to rebrand.
- `AppShadowTheme` — a `ThemeExtension` holding named `BoxShadow` lists (`shadowOne`, `cardShadow`, etc.), retrieved via `Theme.of(context).extension<AppShadowTheme>()`. `ThemeCard` uses this automatically.
- The `*_theme.dart` files under `lib/src/components/` (`button_theme.dart`, `card_theme.dart`, `app_bar_theme.dart`, etc.) are internal `ThemeData` factory builders consumed by `AppTheme` — you should not need to call them directly; override via `AppTheme.lightTheme(colorScheme:, textTheme:, shadows:)` instead.

---

## Conventions for adding a new component

- Public, reusable widgets live in `lib/src/widgets/`; theme-plumbing widgets (that just wrap a Material widget to inherit app theming, like `ThemeButton`) live in `lib/src/components/`.
- Export every new public file from `lib/theme.dart`.
- Name widgets `ThemeX` for theme-plumbing wrappers, or a plain descriptive name (e.g. `AddToCartButton`, `ProfileAvatar`) for higher-level opinionated components.
- Prefer configurable enums/params with sensible defaults over hardcoded behavior, so callers can override without forking the widget.
- Update this file when adding, renaming, or changing the public API of a widget.
