import 'package:checkar_app/features/notifications/models/app_notification.dart';

class NotificationsData {
  NotificationsData._();

  static const List<AppNotification> notifications = [
    AppNotification(
      title: 'Urgent issue detected',
      message: 'Battery warning found during your latest dashboard scan.',
      timeLabel: '2h ago',
      type: NotificationType.urgent,
      isUnread: true,
    ),
    AppNotification(
      title: 'Diagnostic report ready',
      message: 'Your vehicle health report for Toyota Corolla 2019 is available.',
      timeLabel: 'Today, 9:41 AM',
      type: NotificationType.diagnostic,
      isUnread: true,
    ),
    AppNotification(
      title: 'Maintenance reminder',
      message: 'Oil change is due soon based on your last service record.',
      timeLabel: 'Yesterday',
      type: NotificationType.reminder,
      isUnread: false,
    ),
    AppNotification(
      title: 'Scan completed',
      message: 'Engine sound analysis finished with no critical issues found.',
      timeLabel: 'Oct 22, 2023',
      type: NotificationType.diagnostic,
      isUnread: false,
    ),
    AppNotification(
      title: 'Welcome to CheckAR',
      message: 'Start by scanning your dashboard or recording engine sounds.',
      timeLabel: 'Oct 18, 2023',
      type: NotificationType.system,
      isUnread: false,
    ),
  ];
}
