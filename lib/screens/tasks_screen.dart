import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_task_screen.dart';
import '../provider/task_data.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 25,
                left: 25,
                right: 25,
                bottom: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Consumer<TaskData>(
                    builder: (context, taskData, child) {
                      final taskCount = taskData.taskCount;
                      final finishedCount = taskData.finishedCount;
                      return Text(
                        taskCount > 0
                            ? '$taskCount' +
                                ' ${taskCount > 1 ? 'Tarefas' : 'Tarefa'}' +
                                '${finishedCount > 0 ? ', $finishedCount ${finishedCount > 1 ? 'Concluídas' : 'Concluída'}' : ''}'
                            : 'Sem Tarefas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        tooltip: 'Adicionar nova Tarefa',
      ),
    );
  }
}
