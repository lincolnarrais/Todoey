import 'dart:io';

import 'package:flutter/cupertino.dart';
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
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskName: task.name,
              isChecked: task.isDone,
              toggleCheckboxState: () => taskData.toggleCheckboxState(task),
              onLongPress: () {
                Platform.isIOS
                    ? showCupertinoDialog(
                        context: context,
                        builder: (_) {
                          return CupertinoAlertDialog(
                            title: Text('DELETAR TAREFA'),
                            content: Text('Deseja deletar a Tarefa?'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  // User presses NO
                                  Navigator.pop(context);
                                },
                                child: Text('Não'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  // User presses YES
                                  taskData.deleteTask(task);
                                  Navigator.pop(context);
                                },
                                child: Text('Sim'),
                              ),
                            ],
                          );
                        },
                      )
                    : showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('DELETAR TAREFA'),
                            content: Text('Deseja deletar a Tarefa?'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  // User presses NO
                                  Navigator.pop(context);
                                },
                                child: Text('Não'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  // User presses YES
                                  taskData.deleteTask(task);
                                  Navigator.pop(context);
                                },
                                child: Text('Sim'),
                              ),
                            ],
                          );
                        },
                      );
              },
            );
          },
        );
      },
    );
  }
}
