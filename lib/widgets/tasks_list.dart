import 'package:flutter/material.dart';

import '../models/task.dart';

import 'task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = widget.tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: tasks[index].name,
          isChecked: tasks[index].isDone,
          toggleCheckboxState: (_) {
            setState(() {
              tasks[index].toggleIsDone();
            });
          },
        );
      },
    );
  }
}
