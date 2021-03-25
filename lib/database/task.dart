class Task {
  int id;
  String task;
  int isDone;
  String catalog; // category

  Task({this.id, this.task, this.isDone, this.catalog});

  Map<String, dynamic> toMap() {
    return {"id": id, "task": task, "isDone": isDone, "catalog": catalog};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    var mapp = Task();

    mapp.id = map['id'];
    mapp.task = map['task'];
    mapp.isDone = map['isDone'];
    mapp.catalog = map['catalog'];
    return mapp;
  }
}
