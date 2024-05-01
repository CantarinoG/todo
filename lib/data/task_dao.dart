import 'package:sqflit_playground/models/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  final Database database;
  static const tableName = "tasks";

  TaskDAO(this.database);

  Future<int> insert(Task task) async {
    return await database.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> readAll() async {
    final maps = await database.query(tableName);
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  Future<int> updateTask(Task task) async {
    return await database.update(
      tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
