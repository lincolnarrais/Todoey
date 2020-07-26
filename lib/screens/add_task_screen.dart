import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 35,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
            ),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              enabledBorder: kUnderlineInputBorder,
              focusedBorder: kUnderlineInputBorder,
            ),
            onChanged: (newText) {
              text = newText;
            },
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            child: FlatButton(
              shape: Border.all(color: Colors.lightBlueAccent),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(text);
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(fontSize: 16),
              ),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
