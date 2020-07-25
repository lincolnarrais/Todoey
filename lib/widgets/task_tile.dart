import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: (newValue) {
          setState(() {
            isChecked = newValue;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool) toggleCheckboxState;

  const TaskCheckbox({
    this.checkboxState,
    this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
      activeColor: Colors.lightBlueAccent,
    );
  }
}
