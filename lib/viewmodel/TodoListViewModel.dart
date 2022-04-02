import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';
import 'package:knowunity_todo_list/provider/TodoListProvider.dart';
import 'package:knowunity_todo_list/services/api_helper/api_response.dart';
import 'package:knowunity_todo_list/services/hooks/useSideEffect.dart';
import 'package:knowunity_todo_list/services/services/todos_service.dart';
import 'package:knowunity_todo_list/view/TodoListScreen.dart';
import 'package:knowunity_todo_list/view/common_widgets/LoadingDialog.dart';
import 'package:provider/provider.dart';

class TodoListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TodoListProvider provider =
        Provider.of<TodoListProvider>(context, listen: true);
    ValueNotifier<UniqueKey> _uniqueKey = useState<UniqueKey>(new UniqueKey());
    ApiResponse<List<TodoItem>> apiResponse = useTodosService(_uniqueKey.value);
    ValueNotifier<bool> _isLoading = useState<bool>(true);

    useSideEffect(() {
      if (apiResponse.status == Status.Done) {
        _isLoading.value = false;
        provider.todos.addAll(apiResponse.data);
      }

      return () {};
    }, [apiResponse]);

    return _isLoading.value
        ? LoadingDialog()
        : TodoListScreen(
            todos: provider.todos,
          );
  }
}
