import 'package:flutter/foundation.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/features/home/data/models/notification_model.dart';

class NotificationController extends ChangeNotifier {
  List<NotificationItem> _notifications = [];
  
  List<NotificationItem> get notifications => List.unmodifiable(_notifications);
  int get unreadCount => _notifications.where((n) => !n.isRead).length;
  bool get hasUnread => unreadCount > 0;

  NotificationController() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    _notifications = [
      NotificationItem(
        id: '1',
        title: 'Additional Check-Up Recommended',
        message: 'We recommend an additional medical check-up based on your entered symptoms',
        hasButton: true,
        buttonText: AppString.start,
        isRead: false,
        time: '2 hours ago',
      ),
      NotificationItem(
        id: '2',
        title: 'Time for Your Routine Check-Up',
        message: 'Routine check-ups help maintain your health and detect issues early',
        hasButton: false,
        isRead: false,
        time: '1 day ago',
      ),
      NotificationItem(
        id: '3',
        title: 'Important Reminder',
        message: 'Don\'t forget to review the symptoms you\'ve entered for an accurate diagnosis',
        hasButton: false,
        isRead: false,
        time: '2 days ago',
      ),
      NotificationItem(
        id: '4',
        title: 'Analysis Complete',
        message: 'Your data has been successfully analyzed. You can now view the results',
        hasButton: false,
        isRead: false,
        time: '3 days ago',
      ),
      NotificationItem(
        id: '5',
        title: 'Your Health Condition Needs Follow-up',
        message: 'It is important to follow up with a specialist',
        hasButton: false,
        isRead: false,
        time: '5 days ago',
      ),
    ];
  }

  void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1 && !_notifications[index].isRead) {
      _notifications[index].isRead = true;
      notifyListeners();
    }
  }

  void markAllAsRead() {
    bool hasChanges = false;
    for (var notification in _notifications) {
      if (!notification.isRead) {
        notification.isRead = true;
        hasChanges = true;
      }
    }
    if (hasChanges) notifyListeners();
  }

  // Fixed: Changed return type from void to NotificationItem?
  NotificationItem? deleteNotification(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _notifications.removeAt(index);
      notifyListeners();
      return notification;
    }
    return null;
  }

  void restoreNotification(NotificationItem notification) {
    _notifications.add(notification);
    _notifications.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }
}
