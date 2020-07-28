import 'dart:convert' as JSON;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  TaskData() {
    try {
      ///TODO: Refatorar este código, extraindo a função anônima dentro de
      ///[then] para um método desta classe.
      _readFile().then((String value) async {
        final fromJson = await JSON.jsonDecode(value);
        if (fromJson.isNotEmpty) {
          for (Map<String, dynamic> map in fromJson) {
            _tasks.add(Task(name: map['name'], isDone: map['isDone']));
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTask(String taskName) async {
    _tasks.add(Task(name: taskName));
    await _writeToFile();
    notifyListeners();
  }

  Future<void> toggleCheckboxState(Task task) async {
    task.toggleIsDone();
    await _writeToFile();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    _tasks.remove(task);
    await _writeToFile();
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

  Future<String> _readFile() async {
    try {
      final File file = await _localFile;
      final ret = file.readAsStringSync();
      notifyListeners();
      print(ret);
      return ret;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<File> _writeToFile() async {
    try {
      final file = await _localFile;
      final tasks = _tasks.map((Task task) => task.toJson()).toList();
      print(tasks);
      await _readFile();
      return await file.writeAsString(JSON.jsonEncode(tasks));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
