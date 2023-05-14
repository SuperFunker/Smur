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
}