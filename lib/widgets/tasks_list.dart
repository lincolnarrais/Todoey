import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_tile.dart';
import '../provider/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.len,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskName: task.name,
              isChecked: task.isDone,
              toggleCheckboxState: () => taskData.toggleCheckboxState(task),
            );
          },
        );
      },
    );
  }
}
