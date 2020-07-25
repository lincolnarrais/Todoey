import 'package:flutter/material.dart';
import '../constants.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) callback;

  const AddTaskScreen({this.callback});

  @override
  Widget build(BuildContext context) {
    String callbackText;

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
            onChanged: (value) {
              callbackText = value;
            },
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            child: FlatButton(
              shape: Border.all(color: Colors.lightBlueAccent),
              onPressed: () {
                callback(callbackText);
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
