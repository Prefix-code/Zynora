class UserNotification {
  final String imageUrl;
  final String title;
  final String description;
  final DateTime dateTime;

  UserNotification({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dateTime: json['date_time'] != null && json['date_time'].toString().isNotEmpty
          ? DateTime.tryParse(json['date_time']) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
