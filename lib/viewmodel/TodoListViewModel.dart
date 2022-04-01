import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';
import 'package:knowunity_todo_list/services/api_helper/api_response.dart';
import 'package:knowunity_todo_list/services/hooks/useSideEffect.dart';
import 'package:knowunity_todo_list/services/services/todos_service.dart';
import 'package:knowunity_todo_list/view/TodoListScreen.dart';
import 'package:knowunity_todo_list/view/common_widgets/LoadingDialog.dart';

class TodoListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<TodoItem>> todos = useState<List<TodoItem>>([]);
    ValueNotifier<UniqueKey> _uniqueKey = useState<UniqueKey>(new UniqueKey());
    ApiResponse<List<TodoItem>> apiResponse = useTodosService(_uniqueKey.value);
    ValueNotifier<bool> _isLoading = useState<bool>(true);

    useSideEffect(() {
      if (apiResponse.status == Status.Done) {
        _isLoading.value = false;
        print("DATTA ${apiResponse.data}");
        todos.value.addAll(apiResponse.data);
        print(todos.value.length);
      }
      return () {};
    }, [apiResponse]);

    return _isLoading.value
        ? LoadingDialog()
        : TodoListScreen(
            todos: todos.value,
          );
  }
}
