import 'package:flutter/material.dart';

import '../models/task.dart';

import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy  milk'),
    Task(name: 'Buy  bread'),
    Task(name: 'Buy  eggs'),
  ];

  @override
  Widget build(BuildContext context) {
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
