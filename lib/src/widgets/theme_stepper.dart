import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemeStepper extends StatelessWidget {
  const ThemeStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Column(
            children: [
              _StepDot(
                index: i,
                isActive: i == currentStep,
                isDone: i < currentStep,
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 64,
                child: Text(
                  steps[i],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.labelLarge.copyWith(
                    color: i <= currentStep
                        ? scheme.onSurface
                        : scheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ],
          ),
          if (i != steps.length - 1)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Container(
                  height: 2,
                  color: i < currentStep ? scheme.primary : scheme.outline,
                ),
              ),
            ),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.index, required this.isActive, required this.isDone});

  final int index;
  final bool isActive;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = isDone || isActive ? scheme.primary : scheme.surface;
    final fg = isDone || isActive ? scheme.onPrimary : scheme.onSurface.withValues(alpha: 0.6);

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: isDone || isActive ? scheme.primary : scheme.outline, width: 1.5),
      ),
      child: isDone
          ? Icon(Icons.check, size: 16, color: fg)
          : Text('${index + 1}', style: AppTypography.labelLarge.copyWith(color: fg)),
    );
  }
}
