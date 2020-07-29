import 'dart:convert' show jsonEncode, jsonDecode;
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  int _finishedCount = 0;

  TaskData() {
    try {
      _readFile().then((value) async => await _loadData(value));
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

  /// Loads the data back to the Task objects.
  /// Supposed to be called right after [_readFile].
  Future<void> _loadData(String value) async {
    final json = await jsonDecode(value);

    if (json.isNotEmpty) {
      for (Map<String, dynamic> map in json) {
        _tasks.add(Task.fromJson(map));
        if (map['isDone']) {
          _finishedCount++;
        }
      }
    } else {
      debugPrint('json is Empty');
    }
    debugPrint('data loaded: $json', wrapWidth: 80);
  }

  Future<void> addTask(String taskName) async {
    if (taskName != null) {
      _tasks.add(Task(name: taskName));
      await _writeToFile();
      notifyListeners();
    }
  }

  /// Toggles a particular Task's [isDone] property, and counts (or stops
  /// counting) a Task as finished.
  Future<void> toggleCheckboxState(Task task) async {
    task.toggleIsDone();
    if (task.isDone) {
      _finishedCount++;
    } else {
      _finishedCount--;
    }
    await _writeToFile();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    _tasks.remove(task);
    if (task.isDone) {
      _finishedCount--;
    }
    await _writeToFile();
    notifyListeners();
  }

  List<Task> get tasks {
    return [..._tasks];
  }

  int get taskCount {
    return isNotEmpty ? _tasks.length : 0;
  }

  int get finishedCount {
    return _finishedCount;
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
      debugPrint('data saved: $tasks', wrapWidth: 80);
      return await file.writeAsString(jsonEncode(tasks));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
