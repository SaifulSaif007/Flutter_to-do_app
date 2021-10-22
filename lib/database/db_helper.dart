import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/task.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_db.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    Database _db = await database();

    return await _db
        .insert('task', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) => value);
  }

  Future<void> updateTask(int id, String title) async {
    Database _db = await database();

    await _db.rawUpdate("update task set title = '$title' where id = '$id' ");
    
  }

  Future<List<Task>> getTasks() async {
    Database _db = await database();

    List<Map<String, dynamic>> maps = await _db.query('task');
    return List.generate(maps.length, (index) {
      return Task(
          id: maps[index]['id'],
          title: maps[index]['title'],
          description: maps[index]['description']);
    });
  }
}
