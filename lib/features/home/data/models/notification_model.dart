class NotificationItem {
  final String id;
  final String title;
  final String message;
  final bool hasButton;
  final String? buttonText;
  bool isRead;
  final String time;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.hasButton,
    this.buttonText,
    required this.isRead,
    required this.time,
  });

  NotificationItem copyWith({
    String? id,
    String? title,
    String? message,
    bool? hasButton,
    String? buttonText,
    bool? isRead,
    String? time,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      hasButton: hasButton ?? this.hasButton,
      buttonText: buttonText ?? this.buttonText,
      isRead: isRead ?? this.isRead,
      time: time ?? this.time,
    );
  }
}
