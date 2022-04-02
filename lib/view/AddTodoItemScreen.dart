import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoItemScreen extends StatelessWidget {
  TextEditingController textEditingController;
  Function addItemToListCallBack;

  AddTodoItemScreen({this.addItemToListCallBack, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add- Item"),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: InkWell(
        child: Container(
          height: 60,
          color: Colors.blue,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
