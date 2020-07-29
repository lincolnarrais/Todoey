class Task {
  String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  Task.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    isDone = map['isDone'];
  }

  void toggleIsDone() => isDone = !isDone;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }
}
