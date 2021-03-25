import 'database.dart';
import 'task.dart';

class TaskApi {
  Future<void> insertTask(Task task) async {
    var db = await DataBaseHelper.getdb();
    db.insert("Task", task.toMap());
  }

  Future<List> getTasks(String catalog) async {
    var db = await DataBaseHelper.getdb();
    // Query the table for all The Dogs.
    List<Map<String, dynamic>> maps =
        await db.query('Task', where: "catalog = ?", whereArgs: [catalog]);

    return maps;
  }

  Future<void> deleteTask(int id) async {
    var db = await DataBaseHelper.getdb();
    db.delete(
      "Task",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateTask(Task task) async {
    var db = await DataBaseHelper.getdb();
    db.update("Task", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }
}
