import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_tile.dart';
import '../provider/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).len,
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: Provider.of<TaskData>(context).tasks[index].name,
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
          toggleCheckboxState: (_) {
            Provider.of<TaskData>(context, listen: false)
                .toggleCheckboxState(index);
          },
        );
      },
    );
  }
}
