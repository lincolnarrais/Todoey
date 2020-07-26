import 'package:flutter/foundation.dart';

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy  milk'),
    Task(name: 'Buy  bread'),
    Task(name: 'Buy  eggs'),
  ];

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleCheckboxState(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  List<Task> get tasks => [..._tasks];

  int get len => _tasks.length;
}
