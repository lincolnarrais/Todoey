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
            return TaskTile(
              taskName: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              toggleCheckboxState: () => taskData.toggleCheckboxState(index),
            );
          },
        );
      },
    );
  }
}
