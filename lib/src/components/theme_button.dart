import 'package:flutter/material.dart';

import 'package:theme/src/shadows/app_shadow_theme.dart';

enum ThemeButtonVariant { elevated, filled, outlined, text }

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ThemeButtonVariant.filled,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final ThemeButtonVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadows = theme.extension<AppShadowTheme>() ?? const AppShadowTheme();
    final hasCustomShadow = shadows.buttonShadow.isNotEmpty;
    final child = Text(label);
    final iconWidget = icon == null ? null : Icon(icon);

    Widget button = switch (variant) {
      ThemeButtonVariant.elevated => iconWidget == null
          ? ElevatedButton(onPressed: onPressed, child: child)
          : ElevatedButton.icon(onPressed: onPressed, icon: iconWidget, label: child),
      ThemeButtonVariant.filled => iconWidget == null
          ? FilledButton(onPressed: onPressed, child: child)
          : FilledButton.icon(onPressed: onPressed, icon: iconWidget, label: child),
      ThemeButtonVariant.outlined => iconWidget == null
          ? OutlinedButton(onPressed: onPressed, child: child)
          : OutlinedButton.icon(onPressed: onPressed, icon: iconWidget, label: child),
      ThemeButtonVariant.text => iconWidget == null
          ? TextButton(onPressed: onPressed, child: child)
          : TextButton.icon(onPressed: onPressed, icon: iconWidget, label: child),
    };

    if (!hasCustomShadow || variant == ThemeButtonVariant.text) return button;

    final radius = _buttonRadius(theme);
    return Opacity(
      opacity: onPressed == null ? 0.5 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadows.buttonShadow,
        ),
        child: button,
      ),
    );
  }

  double _buttonRadius(ThemeData theme) {
    final shape = theme.filledButtonTheme.style?.shape?.resolve({});
    if (shape is RoundedRectangleBorder) {
      return shape.borderRadius.resolve(TextDirection.ltr).topLeft.x;
    }
    return 12;
  }
}

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon), onPressed: onPressed, tooltip: tooltip);
  }
}

class ThemeTapButton extends StatelessWidget {
  const ThemeTapButton({
    super.key,
    this.child,
    this.onTap,
    this.shape = const RoundedRectangleBorder(),
    this.size,
    this.decoration,
    this.duration = const Duration(milliseconds: 150),
  });

  final Widget? child;
  final VoidCallback? onTap;
  final ShapeBorder shape;
  final Size? size;
  final BoxDecoration? decoration;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: duration,
          width: size?.width,
          height: size?.height,
          alignment: Alignment.center,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}

class ThemeFab extends StatelessWidget {
  const ThemeFab({super.key, required this.icon, this.onPressed, this.label});

  final IconData icon;
  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label!),
      );
    }
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
  }
}
