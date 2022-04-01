import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';

class TodoListScreen extends StatelessWidget {
  List<TodoItem> todos;

  TodoListScreen({this.todos});

  @override
  Widget build(BuildContext context) {
    print(todos.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${todos[index].id.toString() ?? ''}',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Title: ${todos[index].title ?? ''}',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Completed: ${todos[index].completed.toString() ?? ''}',
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
