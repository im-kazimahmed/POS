class NotificationItem {
  final String id;
  final String title;
  final String description;
  final bool isRead;
  final String date;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    this.isRead = false,
    required this.date
  });
}
