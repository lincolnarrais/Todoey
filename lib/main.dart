import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/tasks_screen.dart';
import 'provider/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Todoey',
        home: TasksScreen(),
      ),
    );
  }
}
