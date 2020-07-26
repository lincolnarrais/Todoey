import 'package:flutter/foundation.dart';

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

  void toggleCheckboxState(int index) {
    _tasks[index].toggleIsDone();
    notifyListeners();
  }

  List<Task> get tasks => [..._tasks];

  int get len => _tasks.length;
}

class Task {
  String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleIsDone() => isDone = !isDone;
}
