import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database _dataBase;

  static Future<Database> getdb() async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await initDB();
    return _dataBase;
  }

  static initDB() async {
    String path = join(await getDatabasesPath(), 'tasks_db.db');
    var taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: _FirstCreate,
    );
    return taskDb;
  }

  static void _FirstCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Task (
        id INTEGER PRIMARY KEY,
        task TEXT,
        isDone INTEGER,
        catalog TEXT
        )''');
  }

  execute(String s) {}
}
