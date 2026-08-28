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
- [State & status widgets](#state--status-widgets)
- [Form helpers](#form-helpers)
- [Media & content widgets](#media--content-widgets)
- [App shell & status pages](#app-shell--status-pages)
- [Pickers](#pickers)
- [Commerce & access widgets](#commerce--access-widgets)
- [Third-party dependencies](#third-party-dependencies)

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
Elevated container with theme-aware shadow and rounded corners. Pass `selected: true` for a selection border that always shares this card's own resolved radius (via `selectedColor`/`selectedBorderWidth`) — draw selection this way rather than wrapping `ThemeCard` in your own bordered `Container`, which can drift out of sync if the radius changes (e.g. via a theme preset).
```dart
ThemeCard({
  required Widget child,
  Color? color,
  double borderRadius = 16,
  Clip clipBehavior = Clip.antiAlias,
  EdgeInsetsGeometry margin = const EdgeInsets.all(8),
  bool selected = false,
  Color? selectedColor,       // defaults to colorScheme.primary
  double selectedBorderWidth = 2,
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
Compact by default (dense field, 14px text, tight content padding). Menu popup height auto-sizes to the item count (44px/row, capped at 280px) unless you pass `menuHeight`; pass `width` to constrain the field/menu width — otherwise it sizes to the widest entry. Global entry-row padding also comes from the theme's `MenuButtonThemeData` (compact density, shrink-wrapped tap target), so `ThemePopupMenu` and other menu-based widgets are compact too.
```dart
ThemeDropdown<T>({
  required List<DropdownMenuEntry<T>> items,
  T? initialSelection,
  ValueChanged<T?>? onSelected,
  String? hintText,
  String? label,
  double? width,
  double? menuHeight,
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
Bordered, rounded container around Material's `DataTable`, with automatic zebra-striping on odd rows (skipped for any `DataRow` that sets its own `color`).
```dart
ThemeDataTable({required List<DataColumn> columns, required List<DataRow> rows})
```

### `ThemeScrollbar`
```dart
ThemeScrollbar({required Widget child, ScrollController? controller, bool thumbVisibility = true})
```

### `ThemeCarousel`
Wraps Material's `CarouselView` in a fixed-height `SizedBox` (`height`, default 180) — `CarouselView` has no intrinsic height and disappears inside unbounded-height ancestors (e.g. a `ListView`) without one.
```dart
ThemeCarousel({required List<Widget> children, double itemExtent = 300, double height = 180})
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

## State & status widgets

Common list/screen states (empty, error, loading) and status indicators — near-universal needs across any app screen.

### `ThemeEmptyState`
Icon + title + optional subtitle + optional CTA, centered — for empty lists/search results.
```dart
ThemeEmptyState({
  required String title,
  String? subtitle,
  IconData icon = Icons.inbox_outlined,
  String? actionLabel,
  VoidCallback? onAction, // only shown if both actionLabel and onAction are set
})
```
```dart
ThemeEmptyState(
  title: 'No orders yet',
  subtitle: 'Your past orders will show up here.',
  icon: Icons.receipt_long_outlined,
  actionLabel: 'Start shopping',
  onAction: () => Navigator.pushNamed(context, '/shop'),
)
```

### `ThemeErrorState`
Same layout as `ThemeEmptyState`, styled for failures — error-colored icon, retry action.
```dart
ThemeErrorState({
  String title = 'Something went wrong',
  String? subtitle,
  IconData icon = Icons.error_outline,
  String retryLabel = 'Retry',
  VoidCallback? onRetry, // retry button only shown if set
})
```

### `ThemeShimmer` / `ThemeShimmerList`
Animated skeleton-loading placeholder (sweeping gradient). `ThemeShimmerList` is a preset vertical list of shimmer rows for list-loading states.
```dart
ThemeShimmer({double? width, double height = 16, double borderRadius = 8})
ThemeShimmerList({int itemCount = 6, double itemHeight = 64, double spacing = 12})
```
```dart
isLoading ? const ThemeShimmerList() : ListView(children: items)
```

### `ThemeStatusPill`
Small colored status/label pill (order status, tags, etc.) — semantic color by `ThemeStatus`.
```dart
ThemeStatusPill({
  required String label,
  ThemeStatus status = ThemeStatus.neutral, // success | error | warning | info | neutral
  IconData? icon,
})
```
```dart
ThemeStatusPill(label: 'Delivered', status: ThemeStatus.success, icon: Icons.check_circle_outline)
```

### `ThemeConfirmDialog`
Confirm/cancel dialog helper — resolves `true` only when the user taps confirm (never on dismiss/cancel).
```dart
ThemeConfirmDialog.show(BuildContext context, {
  required String title,
  String? content,
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
  bool isDestructive = false, // renders confirm label in colorScheme.error
  bool barrierDismissible = true,
}) // returns Future<bool>
```
```dart
if (await ThemeConfirmDialog.show(context, title: 'Delete address?', isDestructive: true)) {
  await deleteAddress(id);
}
```

### `ThemeCountdownTimer`
Self-ticking `mm:ss` (or `hh:mm:ss` past one hour) countdown text, e.g. for OTP resend / flash-sale timers.
```dart
ThemeCountdownTimer({
  required Duration duration,
  VoidCallback? onFinished,
  TextStyle? style, // defaults to AppTypography.titleMedium
})
```

---

## Form helpers

### `ThemeStatCard`
Metric tile: label, value, optional leading icon, optional up/down/neutral trend line — for dashboards/profile summaries.
```dart
ThemeStatCard({
  required String label,
  required String value,
  IconData? icon,
  ThemeStatTrend? trend, // up | down | neutral
  String? trendLabel,    // e.g. '+12% this week' — shown only if trend is also set
})
```

### `ThemeStepper`
Horizontal numbered step indicator (checkoout flows, onboarding, multi-step forms) — no interaction, purely a progress display driven by `currentStep`.
```dart
ThemeStepper({required List<String> steps, required int currentStep})
```
```dart
ThemeStepper(steps: ['Cart', 'Address', 'Payment', 'Done'], currentStep: 1)
```

### `ThemeOtpField`
Auto-advancing row of single-digit boxes for OTP/verification codes.
```dart
ThemeOtpField({
  int length = 6,
  ValueChanged<String>? onChanged,   // fires on every digit entered/removed
  ValueChanged<String>? onCompleted, // fires once when all boxes are filled
  bool autofocus = true,
})
```

### `ThemePasswordField`
`TextField` with a lock icon and a built-in show/hide toggle — `ThemeTextField`'s `suffixIcon` is static, so this exists as a ready-made stateful password input.
```dart
ThemePasswordField({
  TextEditingController? controller,
  String? hintText,
  String? labelText = 'Password',
  String? errorText,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
  bool enabled = true,
})
```

### `ThemeLabeledField`
Generic label (+ optional required `*` marker) + field + helper text wrapper, for building form rows around any input widget (not just `ThemeTextField`).
```dart
ThemeLabeledField({
  required String label,
  required Widget child,
  String? helperText,
  bool required = false,
})
```
```dart
ThemeLabeledField(
  label: 'Shipping address',
  required: true,
  helperText: 'We deliver to this address by default.',
  child: ThemeTextField(hintText: '123 Main St'),
)
```

---

## Media & content widgets

Pulls in real third-party packages (`video_player`, `file_picker`, `markdown_widget`) rather than stubs — see [Third-party dependencies](#third-party-dependencies) below for what each one adds to a consuming app.

### `ThemeImageViewer`
Full-screen pinch-to-zoom image viewer (`InteractiveViewer` + black background). Tap to dismiss.
```dart
ThemeImageViewer({required Object src, Object? heroTag, double minScale = 1, double maxScale = 4})
ThemeImageViewer.show(BuildContext context, {required Object src, Object? heroTag}) // pushes it as a route
```
`src` accepts the same types as `ThemeLazyImage` (`String` URL/asset path, or `Uint8List`).

### `ThemeGallery`
Grid of thumbnails (via `ThemeLazyImage`) that opens a swipeable, zoomable full-screen pager on tap, with a Hero transition and a "n / total" counter.
```dart
ThemeGallery({required List<Object> sources, int crossAxisCount = 3, double spacing = 4, double borderRadius = 8})
```

### `ThemeVideoPlayer`
Wraps `video_player` with themed play/pause + scrubber controls that fade in/out on tap.
```dart
ThemeVideoPlayer({
  required String source,
  ThemeVideoSourceType sourceType = ThemeVideoSourceType.network, // network | asset | file
  bool autoPlay = false,
  bool looping = false,
  bool showControls = true,
  double? aspectRatio,   // defaults to the video's native aspect ratio once loaded
  double borderRadius = 12,
})
```
`sourceType: .file` uses `dart:io`'s `File` — don't use it on web builds.

### `ThemeMarkdown`
Renders markdown via `markdown_widget`, pre-wired to the current `Theme` (picks light/dark config from `Theme.of(context).brightness`, paragraph/link colors from `colorScheme`).
```dart
ThemeMarkdown({
  required String data,
  bool selectable = true,
  bool shrinkWrap = true,
  ScrollPhysics? physics,
  EdgeInsetsGeometry? padding,
})
```

### `ThemeCodeBlock`
Monospace code display with an optional language label and copy-to-clipboard button. No syntax highlighting (no highlighter dependency) — use `ThemeMarkdown` with fenced code blocks if you need that.
```dart
ThemeCodeBlock({required String code, String? language, bool showCopyButton = true, double borderRadius = 12})
```

### `ThemeExpandableText`
Text that truncates past `trimLines` with a "Show more" / "Show less" toggle — only shows the toggle if the text actually overflows.
```dart
ThemeExpandableText(
  String text, {
  int trimLines = 3,
  TextStyle? style,
  String expandLabel = 'Show more',
  String collapseLabel = 'Show less',
})
```

---

## App shell & status pages

### `ThemeSplashScreen`
Centered logo/app-name/tagline + optional spinner, for a launch screen.
```dart
ThemeSplashScreen({
  Widget? logo,
  String? appName,
  String? tagline,
  bool showProgress = true,
  Color? backgroundColor,
})
```

### `ThemeErrorPage`
Full-screen 404 / 403 / 500 page via named constructors — each pre-fills a sensible icon, title, subtitle, and action label (all overridable).
```dart
ThemeErrorPage.notFound({String? title, String? subtitle, String? actionLabel, VoidCallback? onAction})
ThemeErrorPage.forbidden({String? title, String? subtitle, String? actionLabel, VoidCallback? onAction})
ThemeErrorPage.serverError({String? title, String? subtitle, String? actionLabel, VoidCallback? onAction})
```
```dart
ThemeErrorPage.notFound(onAction: () => Navigator.of(context).pushReplacementNamed('/'))
```

### `ThemeAppDialog`
Generic dialog shell for arbitrary widget content — `ThemeDialog` only takes a `String? content`; use this when the body needs real widgets (a form, a list, custom layout).
```dart
ThemeAppDialog.show<T>(BuildContext context, {
  String? title,
  required Widget content,
  List<Widget>? actions,
  bool barrierDismissible = true,
  double? maxWidth, // defaults to 480
}) // returns Future<T?>
```

---

## Pickers

### `ThemeIconPicker`
Grid of `IconData` to choose from, with a selected-state outline.
```dart
ThemeIconPicker({required List<IconData> icons, IconData? selected, ValueChanged<IconData>? onSelected, int crossAxisCount = 6, double iconSize = 22})
ThemeIconPicker.show(BuildContext context, {required List<IconData> icons, IconData? selected}) // returns Future<IconData?>, opens as a bottom sheet
```

### `ThemeEmojiPicker`
Grid-based emoji picker. Bring your own emoji list (this package doesn't bundle an emoji dataset) — group them by category upstream and render one picker per category/tab if needed.
```dart
ThemeEmojiPicker({required List<String> emojis, ValueChanged<String>? onSelected, int crossAxisCount = 8, double emojiSize = 24})
ThemeEmojiPicker.show(BuildContext context, {required List<String> emojis}) // returns Future<String?>, opens as a bottom sheet
```

### `ThemeColorPicker`
Row/wrap of color swatches with a checkmark on the selected one (auto-contrasted black/white check).
```dart
ThemeColorPicker({required List<Color> colors, Color? selected, ValueChanged<Color>? onSelected, double swatchSize = 36, double spacing = 10})
```

### `ThemeFileUploader`
Dashed drop-zone-style picker button (wraps `file_picker`) with a picked-files list (name + remove button) below it.
```dart
ThemeFileUploader({
  ValueChanged<List<PlatformFile>>? onFilesPicked,
  bool allowMultiple = false,
  FileType type = FileType.any, // from file_picker
  List<String>? allowedExtensions,
  String label = 'Choose file',
  String hint = 'or drag and drop',
})
```

---

## Commerce & access widgets

### `ThemeDiscountBadge`
Small "-N%" pill, e.g. on a product card.
```dart
ThemeDiscountBadge({required int percentOff, Color? color}) // color defaults to colorScheme.error
```

### `ThemeWishlistButton`
Animated heart toggle (outline ↔ filled) with a scale transition.
```dart
ThemeWishlistButton({required bool isWishlisted, ValueChanged<bool>? onChanged, double size = 24, Color? filledColor})
```

### `ThemePermissionSelector`
List of togglable permissions/roles/feature-flags, each a switch row with optional icon and description.
```dart
ThemePermission({required String id, required String label, String? description, IconData? icon})

ThemePermissionSelector({
  required List<ThemePermission> permissions,
  required Set<String> selectedIds,
  ValueChanged<Set<String>>? onChanged,
})
```

---

## Third-party dependencies

Beyond `google_fonts`, this package depends on `video_player` (`ThemeVideoPlayer`), `file_picker` (`ThemeFileUploader`), and `markdown_widget` (`ThemeMarkdown`). These pull in native platform code (iOS/Android/desktop plugin implementations) — every consuming app inherits that footprint even if it never uses those three widgets, since Dart/Flutter has no per-widget tree-shaking of native plugin registration. If binary size or platform-permission surface matters for your app, keep this in mind when upgrading the package.

---

## Colors & shadows (advanced / theming internals)

- `AppColors` — static light/dark palette constants and `lightColorScheme` / `darkColorScheme` getters. Pass a derived `ColorScheme` into `AppTheme.lightTheme(colorScheme: ...)` to rebrand. Defines full container roles (`primaryContainer`/`onPrimaryContainer`, `secondaryContainer`/`onSecondaryContainer`, `errorContainer`/`onErrorContainer`, `surfaceContainer(Low/High)`, `inverseSurface`/`onInverseSurface`) — not just the base `primary`/`secondary`/`surface`/`error` — so any widget that reads a container role from `ColorScheme` gets a color coherent with your brand instead of Flutter's unrelated hardcoded defaults.
- `AppShadowTheme` — a `ThemeExtension` holding named `BoxShadow` values (`shadowOne`, `cardShadow`, etc.), retrieved via `Theme.of(context).extension<AppShadowTheme>()`. `ThemeCard` uses this automatically. `AppShadowTheme()` (default) is tuned for light backgrounds; `AppShadowTheme.dark()` uses higher-opacity, larger-blur shadows so elevation stays visible against near-black surfaces — `AppTheme.darkTheme()` uses `AppShadowTheme.dark()` by default. Cards, menus, and dropdowns also lift onto a `surfaceContainer`-toned background in dark mode so elevation reads from surface tint as well as shadow, matching Material 3 dark-theme conventions.
- The `*_theme.dart` files under `lib/src/components/` (`button_theme.dart`, `card_theme.dart`, `app_bar_theme.dart`, etc.) are internal `ThemeData` factory builders consumed by `AppTheme` — you should not need to call them directly; override via `AppTheme.lightTheme(colorScheme:, textTheme:, shadows:)` instead.

---

## Conventions for adding a new component

- Public, reusable widgets live in `lib/src/widgets/`; theme-plumbing widgets (that just wrap a Material widget to inherit app theming, like `ThemeButton`) live in `lib/src/components/`.
- Export every new public file from `lib/theme.dart`.
- Name widgets `ThemeX` for theme-plumbing wrappers, or a plain descriptive name (e.g. `AddToCartButton`, `ProfileAvatar`) for higher-level opinionated components.
- Prefer configurable enums/params with sensible defaults over hardcoded behavior, so callers can override without forking the widget.
- Update this file when adding, renaming, or changing the public API of a widget.

---

## New widgets

### `ThemeLazyImage`
Fade-in image with placeholder and error fallback. Accepts a network URL string, an asset path string, or `Uint8List` bytes. Respects `cacheWidth`/`cacheHeight` via `ResizeImage` for memory efficiency.
```dart
ThemeLazyImage({
  required Object src, // String (http/asset) or Uint8List
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
  Widget? placeholder,
  Widget? errorWidget,
  double borderRadius = 12,
  int? cacheWidth,
  int? cacheHeight,
  Duration fadeDuration = const Duration(milliseconds: 300),
})
```

### `ThemeSpinner`
Six custom-painted spinner types: `ripple`, `wave`, `dots`, `pulse`, `bars`, `dualRing`.
```dart
ThemeSpinner({
  ThemeSpinnerType type = ThemeSpinnerType.ripple,
  double size = 36,
  Color? color,
  double strokeWidth = 3,
  Duration duration = const Duration(milliseconds: 1000),
})
```

### `ThemeSkeleton` / `ThemeSkeletonLoader`
Loading skeletons built on `ThemeShimmer`. `ThemeSkeletonType`: `textLine`, `circleAvatar`, `card`, `listTile`, `gridTile`, `banner`, `paragraph`.
```dart
ThemeSkeleton({ThemeSkeletonType type, double? width, double? height, double borderRadius = 8})
ThemeSkeletonLoader({ThemeSkeletonType type = ThemeSkeletonType.listTile, int count = 6, double spacing = 12})
```

### `ThemeSearchableDropdown<T>`
Dropdown with an overlay search field. Generic over item type `T`; `itemLabel` extracts display text.
```dart
ThemeSearchableDropdown<T>({
  required List<T> items,
  String? label,
  String? hint,
  T? value,
  ValueChanged<T?>? onChanged,
  String Function(T) itemLabel, // default: toString()
  Widget Function(T)? itemLeading,
  double maxHeight = 320,
  bool enabled = true,
})
```

### `ThemeOtpInput`
OTP input with configurable box shape (`circle`/`rectangle`), paste support, and obscure mode.
```dart
ThemeOtpInput({
  int length = 6,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onCompleted,
  bool autofocus = true,
  BoxShape boxShape = BoxShape.circle,
  double boxSize = 52,
  double spacing = 10,
  bool obscure = false,
  TextInputType keyboardType = TextInputType.number,
})
```

### `ThemeAppPasswordField`
Password field with show/hide toggle and optional 4-segment strength indicator (`weak`/`fair`/`good`/`strong`).
```dart
ThemeAppPasswordField({
  TextEditingController? controller,
  String? hintText,
  String labelText = 'Password',
  String? errorText,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
  bool enabled = true,
  bool showStrengthIndicator = false,
})
```

### `ThemeAccordion` / `ThemeAccordionList` / `ThemeAccordionItem`
Animated expand/collapse section with rotation indicator. `ThemeAccordionList` renders multiple items.
```dart
ThemeAccordion({
  required Widget title,
  required List<Widget> children,
  Widget? leading,
  Widget? trailing,
  bool initiallyExpanded = false,
  IconData? expandIcon,
})
ThemeAccordionItem({required Widget title, required List<Widget> children, Widget? leading, Widget? trailing})
ThemeAccordionList({required List<ThemeAccordionItem> items, int? initiallyExpandedIndex})
```

### `ThemePullToRefresh`
Themed `RefreshIndicator` wrapper.
```dart
ThemePullToRefresh({
  required Widget child,
  Future<void> Function()? onRefresh,
  double displacement = 40,
  ThemeSpinnerType refreshIndicatorType = ThemeSpinnerType.ripple,
})
```

### `ThemeDraggableList<T>`
Reorderable list with drag handle, proxy elevation, and custom leading/trailing builders.
```dart
ThemeDraggableList<T>({
  required List<T> items,
  required Widget Function(BuildContext, T, int) itemBuilder,
  ValueChanged<List<T>>? onReorder,
  Widget Function(BuildContext, T, int)? leading,
  Widget Function(BuildContext, T, int)? trailing,
  double spacing = 8,
})
```

### `ThemeAppDataTable`
Sortable, striped, paginated data table with optional checkbox selection. Uses `ThemeDataColumn` for column config.
```dart
ThemeAppDataTable({
  required List<ThemeDataColumn> columns,
  required List<List<Widget>> rows,
  ValueChanged<int>? onRowTap,
  void Function(int columnIndex, bool ascending)? onSort,
  bool stripeRows = true,
  bool showCheckboxColumn = false,
  ValueChanged<Set<int>>? onSelectionChanged,
  int? pageSize,
  Widget? header,
})
ThemeDataColumn({required Widget label, bool numeric = false, bool sortable = false})
```

### `ThemeAppConfirmDialog`
Confirm dialog with optional leading icon; `isDestructive` colors the confirm button with `colorScheme.error`.
```dart
ThemeAppConfirmDialog.show(BuildContext context, {
  required String title,
  String? content,
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
  bool isDestructive = false,
  bool barrierDismissible = true,
  IconData? icon,
}) // returns Future<bool>
```

### `ThemeNotificationCard`
In-app notification card with typed color/icon (`info`/`success`/`warning`/`error`/`default_`), timestamp, actions, and dismiss button.
```dart
ThemeNotificationCard({
  required String title,
  String? message,
  ThemeNotificationType type = ThemeNotificationType.default_,
  Widget? leading,
  List<Widget> actions = const [],
  VoidCallback? onDismiss,
  String? timestamp,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
})
```

### `ThemePushNotification`
OS-style push notification card. Styles: `basic`, `bigText`, `bigImage`, `inbox`, `media`, `progress`.
```dart
ThemePushNotification({
  required String title,
  String? body,
  ThemePushNotificationStyle style = ThemePushNotificationStyle.basic,
  ImageProvider? imageProvider,
  List<String> lines = const [],
  double? progress,
  String? timestamp,
  String appName = 'App',
  Widget appIcon = const Icon(Icons.notifications, size: 14),
  VoidCallback? onTap,
})
```

### `ThemeCommandPalette` / `ThemeCommand`
VS Code / Spotlight-style command palette dialog with fuzzy search, keyboard selection, shortcuts, and tags.
```dart
ThemeCommandPalette.show(BuildContext context, {
  List<ThemeCommand> commands = const [],
  String placeholder = 'Search commands...',
}) // returns Future<ThemeCommand?>

ThemeCommand({
  required String id,
  required String label,
  String? description,
  IconData? icon,
  String? shortcut,
  List<String>? tags,
  VoidCallback? run,
})
```

### `ThemeStyleSwitcher`
Visual horizontal-scroll grid of theme-style preview cards. Each card is painted from the style's own `ColorScheme` and `AppShadowTheme`, so the user sees a faithful miniature of the theme before selecting it. Tap a card to switch the entire app theme live.
```dart
ThemeStyleSwitcher({
  List<AppThemeStyle>? styles, // defaults to AppThemeStyle.all
  String selectedId = 'light',
  ValueChanged<String>? onSelected,
  Brightness brightness = Brightness.light, // which variant to preview
  double cardWidth = 140,
  double cardHeight = 96,
  double spacing = 12,
  bool showLabels = true,
})
```
```dart
ThemeStyleSwitcher(
  selectedId: controller.value.styleId,
  onSelected: controller.setStyle,
)
```

---

## Theme presets

`AppThemePreset` bundles a complete theme (color scheme, shadows, shape radii, typography) into one switchable object. Call `.toThemeData()` to get a `ThemeData` you can pass to `MaterialApp`.

### Usage
```dart
MaterialApp(
  theme: LightPresets.neumorphism.toThemeData(),
  darkTheme: DarkPresets.darkHighContrast.toThemeData(),
  themeMode: ThemeMode.system,
)
```
Switching a preset overwrites every shadow, color, and radius in one call — no per-widget rewiring.

### `LightPresets` (18 presets)
`default`, `flat`, `material`, `neumorphism`, `glassmorphism`, `brutalism`, `maximalism`, `skeuomorphism`, `skeuominimalism`, `retro8bit`, `cyberpunk`, `claymorphism`, `bauhaus`, `organic`, `typographic`, `minimalismMono`, `papercut`, `skeuomorphismClassic`.

`LightPresets.all` — full `List<AppThemePreset>`.
`LightPresets.byId(String id)` — lookup by preset `id`.

### `DarkPresets`
`default`, `darkHighContrast` (`id: 'dark-highcontrast'`).

`DarkPresets.all` / `DarkPresets.byId(String id)`.

### `AppThemePreset` fields
```dart
AppThemePreset({
  required String id,
  required String name,
  required Brightness brightness,
  required ColorScheme colorScheme,
  required AppShadowTheme shadows,
  TextTheme? textTheme,
  double cardRadius = 16,
  double buttonRadius = 12,
  double inputRadius = 12,
  double dialogRadius = 16,
  bool useMaterial3 = true,
})
```

---

## Theme styles (light + dark pairs)

`AppThemeStyle` pairs a light and dark `AppThemePreset` under a single named style. Each of the 20 styles below exposes `.themeData(Brightness)` so you can pass both a `theme` and `darkTheme` from one selection — switching a style overwrites every shadow, color, and radius for both modes at once.

### Usage
```dart
final style = AppThemeStyle.byId('neumorphism');

MaterialApp(
  theme: style.themeData(Brightness.light),
  darkTheme: style.themeData(Brightness.dark),
  themeMode: ThemeMode.system,
)
```

### Available styles (`AppThemeStyle.all`)
| id | name |
|---|---|
| `light` | Light |
| `dark` | Dark |
| `flat` | Flat |
| `material` | Material |
| `neumorphism` | Neumorphism |
| `glassmorphism` | Glassmorphism |
| `brutalism` | Brutalism |
| `maximalism` | Maximalism |
| `skeuomorphism` | Skeuomorphism |
| `skeuominimalism` | Skeuominimalism |
| `dark-highcontrast` | Dark High Contrast |
| `retro-8bit` | Retro 8-bit |
| `cyberpunk` | Cyberpunk |
| `claymorphism` | Claymorphism |
| `bauhaus` | Bauhaus |
| `organic` | Organic |
| `typographic` | Typographic |
| `minimalism-mono` | Minimalism Mono |
| `papercut` | Papercut |
| `skeuomorphism-classic` | Skeuomorphism Classic |

### `AppThemeStyle` API
```dart
AppThemeStyle({
  required String id,
  required String name,
  required AppThemePreset lightPreset,
  required AppThemePreset darkPreset,
})

// pick the preset for a brightness
AppThemePreset preset(Brightness brightness)
// build ThemeData for a brightness
ThemeData themeData(Brightness brightness)

AppThemeStyle.all          // List<AppThemeStyle> (20)
AppThemeStyle.byId(String) // lookup by id, falls back to 'light'
```

### Static constants
Each style is also available as a named constant: `AppThemeStyle.light`, `.dark`, `.flat`, `.material`, `.neumorphism`, `.glassmorphism`, `.brutalism`, `.maximalism`, `.skeuomorphism`, `.skeuominimalism`, `.darkHighContrast`, `.retro8bit`, `.cyberpunk`, `.claymorphism`, `.bauhaus`, `.organic`, `.typographic`, `.minimalismMono`, `.papercut`, `.skeuomorphismClassic`.
