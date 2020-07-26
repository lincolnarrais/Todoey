// TODO implement persistence (JSON?)

import 'package:flutter/foundation.dart';

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Comprar leite'),
    Task(name: 'Comprar pão'),
    Task(name: 'Comprar ovos'),
  ];

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleCheckboxState(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  List<Task> get tasks {
    return [..._tasks];
  }

  int get taskCount {
    return _tasks.length;
  }
}
