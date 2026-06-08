import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

enum NotificationType { urgent, diagnostic, reminder, system }

class AppNotification {
  const AppNotification({
    required this.title,
    required this.message,
    required this.timeLabel,
    required this.type,
    this.isUnread = false,
  });

  final String title;
  final String message;
  final String timeLabel;
  final NotificationType type;
  final bool isUnread;
}

extension NotificationTypeX on NotificationType {
  IconData get icon => switch (this) {
        NotificationType.urgent => Icons.warning_amber_rounded,
        NotificationType.diagnostic => Icons.assignment_outlined,
        NotificationType.reminder => Icons.schedule_outlined,
        NotificationType.system => Icons.info_outline,
      };

  Color get iconColor => switch (this) {
        NotificationType.urgent => AppColors.urgent,
        NotificationType.diagnostic => AppColors.teal,
        NotificationType.reminder => AppColors.warning,
        NotificationType.system => AppColors.greyDark,
      };

  Color get iconBackground => switch (this) {
        NotificationType.urgent => const Color(0xFFFFECEC),
        NotificationType.diagnostic => AppColors.lightBlue,
        NotificationType.reminder => const Color(0xFFFFF3E8),
        NotificationType.system => AppColors.paleGrey,
      };
}
