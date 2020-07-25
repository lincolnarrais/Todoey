import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function(bool) toggleCheckboxState;

  TaskTile({
    @required this.taskName,
    @required this.isChecked,
    @required this.toggleCheckboxState,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggleCheckboxState,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
