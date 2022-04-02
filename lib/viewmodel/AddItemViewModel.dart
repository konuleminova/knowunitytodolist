import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';
import 'package:knowunity_todo_list/provider/TodoListProvider.dart';
import 'package:knowunity_todo_list/services/hooks/use_callback.dart';
import 'package:knowunity_todo_list/view/AddTodoItemScreen.dart';
import 'package:provider/provider.dart';

class AddItemViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TodoListProvider provider =
        Provider.of<TodoListProvider>(context, listen: false);
    var textEditingController = useTextEditingController(text: "");
    var addItemValue = useState<TodoItem>();

    final addItemToListCallBack = useCallback(() {
      addItemValue.value = new TodoItem(
          id: provider.todos.length > 0
              ? provider.todos[provider.todos.length - 1].id + 1
              : 1,
          completed: false,
          title: textEditingController.text ?? '');
      provider.addItemToList(addItemValue.value);
      Navigator.of(context).pop();
    }, [addItemValue.value]);
    return AddTodoItemScreen(
      addItemToListCallBack: addItemToListCallBack,
      textEditingController: textEditingController,
    );
  }
}
