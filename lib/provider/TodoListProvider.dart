import 'package:flutter/cupertino.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';

class TodoListProvider with ChangeNotifier {
  TodoListProvider._();

  static TodoListProvider _instance = TodoListProvider._();

  factory TodoListProvider() {
    return _instance;
  }

  List<TodoItem> todos = [];

  addItemToList(TodoItem item) {
    todos.add(item);
    print("todos ${todos.length}");
    notifyListeners();
  }
}
