import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemeSplashScreen extends StatelessWidget {
  const ThemeSplashScreen({
    super.key,
    this.logo,
    this.appName,
    this.tagline,
    this.showProgress = true,
    this.backgroundColor,
  });

  final Widget? logo;
  final String? appName;
  final String? tagline;
  final bool showProgress;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: backgroundColor ?? scheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (logo != null) logo!,
            if (appName != null) ...[
              const SizedBox(height: 20),
              Text(appName!, style: AppTypography.headlineMedium),
            ],
            if (tagline != null) ...[
              const SizedBox(height: 8),
              Text(
                tagline!,
                style: AppTypography.bodyMedium.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
            if (showProgress) ...[
              const SizedBox(height: 32),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: scheme.primary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
