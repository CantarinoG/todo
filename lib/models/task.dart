class Task {
  final int id;
  final String title;
  final String description;
  int isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  void toggleCompleted() {
    if (isCompleted == 0) {
      isCompleted = 1;
    } else {
      isCompleted = 0;
    }
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
