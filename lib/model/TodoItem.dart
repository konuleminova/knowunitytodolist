class TodoItem {
  int id;
  int userId;
  String title;
  bool completed;

  TodoItem({this.id, this.userId, this.title, this.completed});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        completed: json['completed']);
  }

  @override
  String toString() {
    return 'TodoItem{id: $id, userId: $userId, title: $title, completed: $completed}';
  }
}

List<TodoItem> todoList(List<dynamic> todoList) =>
    List<TodoItem>.from(todoList.map((e) =>TodoItem.fromJson(e)));
