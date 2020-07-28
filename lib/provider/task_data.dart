// TODO implement persistence (JSON?)

import 'dart:convert' as JSON;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Comprar leite'),
    Task(name: 'Comprar pão'),
    Task(name: 'Comprar ovos'),
  ];

  TaskData() {
    readFile();
  }

  Future<void> addTask(String taskName) async {
    _tasks.add(Task(name: taskName));
    await writeToFile();
    notifyListeners();
  }

  Future<void> toggleCheckboxState(Task task) async {
    task.toggleIsDone();
    await writeToFile();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    _tasks.remove(task);
    await writeToFile();
    notifyListeners();
  }

  List<Task> get tasks {
    return [..._tasks];
  }

  int get taskCount {
    return _tasks.length;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  /// THIS NEEDS FIXING
  Future<void> readFile() async {
    final file = await _localFile;
    final tasks = JSON.jsonDecode(await file.readAsString());
    _tasks = tasks['taskList'];
  }

  Future<void> writeToFile() async {
    final file = await _localFile;
    final tasks = _tasks.map((task) {
      return {'name': task.name, 'isDone': task.isDone};
    }).toList();
    await file.writeAsString(JSON.jsonEncode(tasks));
  }
}
