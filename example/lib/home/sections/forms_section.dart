import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class FormsSection extends StatelessWidget {
  const FormsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeStatCard',
          child: Row(
            children: [
              Expanded(
                child: ThemeStatCard(
                  label: 'Revenue',
                  value: '\$12,480',
                  icon: Icons.payments_outlined,
                  trend: ThemeStatTrend.up,
                  trendLabel: '+12% this week',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ThemeStatCard(
                  label: 'Refunds',
                  value: '\$320',
                  icon: Icons.replay_outlined,
                  trend: ThemeStatTrend.down,
                  trendLabel: '-4% this week',
                ),
              ),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeStepper',
          child: ThemeStepper(
            steps: const ['Cart', 'Address', 'Payment', 'Done'],
            currentStep: 1,
          ),
        ),
        ShowcaseTile(
          title: 'ThemeOtpField',
          description: 'Auto-advancing boxed OTP input, one style option',
          child: ThemeOtpField(autofocus: false, onCompleted: (_) {}),
        ),
        ShowcaseTile(
          title: 'ThemeOtpInput',
          description: 'Configurable box shape/size/spacing and obscure mode',
          child: ThemeOtpInput(autofocus: false, boxShape: BoxShape.rectangle, onCompleted: (_) {}),
        ),
        ShowcaseTile(
          title: 'ThemePasswordField',
          child: const ThemePasswordField(hintText: 'Enter your password'),
        ),
        ShowcaseTile(
          title: 'ThemeAppPasswordField',
          description: 'Same as ThemePasswordField, plus an optional strength indicator',
          child: const ThemeAppPasswordField(
            hintText: 'Enter your password',
            showStrengthIndicator: true,
          ),
        ),
        ShowcaseTile(
          title: 'ThemeLabeledField',
          child: ThemeLabeledField(
            label: 'Shipping address',
            required: true,
            helperText: 'We deliver to this address by default.',
            child: const ThemeTextField(hintText: '123 Main St'),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeSearchableDropdown<T>',
          description: 'Filterable dropdown for long option lists',
          child: ThemeSearchableDropdown<String>(
            label: 'Country',
            hint: 'Select a country',
            items: const ['United States', 'India', 'United Kingdom', 'Germany', 'Japan', 'Brazil'],
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
