import 'package:flutter/material.dart';
import 'package:knowunity_todo_list/provider/TodoListProvider.dart';
import 'package:knowunity_todo_list/viewmodel/TodoListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoListProvider(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: TodoListViewModel()));
  }
}
