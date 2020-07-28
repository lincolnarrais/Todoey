class Task {
  String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isDone = json['isDone'];

  void toggleIsDone() => isDone = !isDone;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }
}
