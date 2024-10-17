class Task {
  final int? id;
  final String title;
  final DateTime dueDate;
  late final bool isCompleted;

  Task({this.id, required this.title, required this.dueDate, this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
