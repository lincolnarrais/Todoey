import 'dart:convert' show jsonEncode, jsonDecode;
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  TaskData() {
    try {
      _readFile().then((String value) async {
        final json = await jsonDecode(value);
        if (json.isNotEmpty) {
          for (Map<String, dynamic> map in json) {
            _tasks.add(Task.fromJson(map));
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  bool get isEmpty {
    return _tasks.isEmpty;
  }

  bool get isNotEmpty {
    return _tasks.isNotEmpty;
  }

  Future<void> addTask(String taskName) async {
    if (taskName != null) {
      _tasks.add(Task(name: taskName));
      await _writeToFile();
      notifyListeners();
    }
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
    return isNotEmpty ? _tasks.length : 0;
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
      if (await file.exists()) {
        notifyListeners();
        return file.readAsStringSync();
      } else {
        return '[]';
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<File> _writeToFile() async {
    try {
      final file = await _localFile;
      final tasks = _tasks.map((Task task) => task.toJson()).toList();
      debugPrint('data saved: ${tasks.toString()}', wrapWidth: 80);
      return await file.writeAsString(jsonEncode(tasks));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
