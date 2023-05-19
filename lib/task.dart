class Task{
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime dateCreated;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.dateCreated,
    required this.isCompleted
});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'dateCreated': dateCreated.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      dateCreated: DateTime.parse(json['dateCreated']),
      isCompleted: json['isCompleted'],
    );
  }
}