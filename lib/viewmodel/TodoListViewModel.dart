import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    ScrollController scrollController =
        useScrollController(initialScrollOffset: 0);
    TodoListProvider provider =
        Provider.of<TodoListProvider>(context, listen: true);
    ValueNotifier<UniqueKey> _uniqueKey = useState<UniqueKey>(new UniqueKey());
    ApiResponse<List<TodoItem>> apiResponse = useTodosService(_uniqueKey.value);

    useSideEffect(() {
      if (apiResponse.status == Status.Done) {
        provider.isloading = false;
        provider.todos.addAll(apiResponse.data.reversed.toList());
      }

      return () {};
    }, [apiResponse]);

    useSideEffect(() {
      if (provider.scrollToBottom && scrollController.hasClients)
        WidgetsBinding.instance.addPostFrameCallback((_) {
         /// scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });

      return () {};
    }, [provider.scrollToBottom]);

    return provider.isloading
        ? LoadingDialog()
        : TodoListScreen(
            scrollController: scrollController,
            todos: provider.todos,
          );
  }
}
