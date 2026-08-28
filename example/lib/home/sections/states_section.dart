import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class StatesSection extends StatelessWidget {
  const StatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeEmptyState',
          child: SizedBox(
            height: 260,
            child: ThemeEmptyState(
              title: 'No orders yet',
              subtitle: 'Your past orders will show up here.',
              icon: Icons.receipt_long_outlined,
              actionLabel: 'Start shopping',
              onAction: () {},
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeErrorState',
          child: SizedBox(
            height: 260,
            child: ThemeErrorState(
              subtitle: 'Check your connection and try again.',
              onRetry: () {},
            ),
          ),
        ),
        ShowcaseTile(
          title: 'ThemeShimmer / ThemeShimmerList',
          child: const SizedBox(height: 220, child: ThemeShimmerList(itemCount: 3)),
        ),
        ShowcaseTile(
          title: 'ThemeSkeleton / ThemeSkeletonLoader',
          description: 'textLine | circleAvatar | card | listTile | gridTile | banner | paragraph',
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeSkeleton(type: ThemeSkeletonType.listTile),
              SizedBox(height: 16),
              ThemeSkeleton(type: ThemeSkeletonType.paragraph),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeSpinner',
          description: 'ripple | wave | dots | pulse | bars | dualRing',
          child: const Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              ThemeSpinner(),
              ThemeSpinner(type: ThemeSpinnerType.wave),
              ThemeSpinner(type: ThemeSpinnerType.dots),
              ThemeSpinner(type: ThemeSpinnerType.bars),
              ThemeSpinner(type: ThemeSpinnerType.dualRing),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeStatusPill',
          child: const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ThemeStatusPill(label: 'Delivered', status: ThemeStatus.success, icon: Icons.check_circle_outline),
              ThemeStatusPill(label: 'Cancelled', status: ThemeStatus.error, icon: Icons.cancel_outlined),
              ThemeStatusPill(label: 'Pending', status: ThemeStatus.warning, icon: Icons.schedule),
              ThemeStatusPill(label: 'In transit', status: ThemeStatus.info, icon: Icons.local_shipping_outlined),
              ThemeStatusPill(label: 'Draft', status: ThemeStatus.neutral),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemeConfirmDialog',
          child: ThemeButton(
            label: 'Delete address',
            variant: ThemeButtonVariant.outlined,
            onPressed: () async {
              final confirmed = await ThemeConfirmDialog.show(
                context,
                title: 'Delete address?',
                content: 'This action cannot be undone.',
                isDestructive: true,
              );
              if (context.mounted) {
                Notify.info(context, confirmed ? 'Confirmed' : 'Cancelled');
              }
            },
          ),
        ),
        ShowcaseTile(
          title: 'ThemeAppConfirmDialog',
          description: 'Same as ThemeConfirmDialog, plus an optional leading icon',
          child: ThemeButton(
            label: 'Delete account',
            variant: ThemeButtonVariant.outlined,
            onPressed: () async {
              final confirmed = await ThemeAppConfirmDialog.show(
                context,
                title: 'Delete account?',
                content: 'All your data will be permanently removed.',
                icon: Icons.warning_amber_rounded,
                isDestructive: true,
              );
              if (context.mounted) {
                Notify.info(context, confirmed ? 'Confirmed' : 'Cancelled');
              }
            },
          ),
        ),
        ShowcaseTile(
          title: 'ThemeCountdownTimer',
          description: 'Resend OTP in',
          child: const ThemeCountdownTimer(duration: Duration(seconds: 90)),
        ),
        ShowcaseTile(
          title: 'ThemeNotificationCard',
          description: 'info | success | warning | error | default_',
          child: Column(
            children: [
              ThemeNotificationCard(
                title: 'Order shipped',
                message: 'Your order #1042 is on its way.',
                type: ThemeNotificationType.success,
                timestamp: '2m ago',
                onDismiss: () {},
              ),
              ThemeNotificationCard(
                title: 'Payment failed',
                message: 'Please update your payment method.',
                type: ThemeNotificationType.error,
                timestamp: '1h ago',
                onDismiss: () {},
              ),
            ],
          ),
        ),
        ShowcaseTile(
          title: 'ThemePushNotification',
          description: 'basic | bigText | inbox | progress (also bigImage / media, with an image)',
          child: const Column(
            children: [
              ThemePushNotification(
                title: 'New message',
                body: 'Ash: Are we still on for the demo tomorrow?',
                timestamp: 'now',
              ),
              ThemePushNotification(
                title: 'Weekly digest',
                style: ThemePushNotificationStyle.inbox,
                lines: ['3 new comments', '1 new follower', 'Your report is ready'],
                timestamp: '3h',
              ),
              ThemePushNotification(
                title: 'Uploading backup',
                style: ThemePushNotificationStyle.progress,
                progress: 0.6,
                timestamp: 'now',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
