import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function toggleCheckboxState;
  final Function onLongPress;

  TaskTile({
    @required this.taskName,
    @required this.isChecked,
    @required this.toggleCheckboxState,
    @required this.onLongPress,
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
        onChanged: (_) => toggleCheckboxState(),
        activeColor: Colors.lightBlueAccent,
      ),
      onTap: toggleCheckboxState,
      onLongPress: onLongPress,
    );
  }
}
