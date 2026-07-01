class Task {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;
  Task({
    this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    required this.createdAt,
  });
}
