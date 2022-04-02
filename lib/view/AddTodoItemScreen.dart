import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoItemScreen extends Dialog {
  TextEditingController textEditingController;
  Function addItemToListCallBack;

  AddTodoItemScreen({this.addItemToListCallBack, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 270,
          width: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(labelText: "Task"),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    addItemToListCallBack();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
