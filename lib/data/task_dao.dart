import 'package:sqflit_playground/data/database_helper.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  final DatabaseHelper databaseHelper;
  static const tableName = "tasks";

  TaskDAO(this.databaseHelper);

  Future<int> insert(Task task) async {
    final database = await databaseHelper.database;
    return await database.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> readAll() async {
    final database = await databaseHelper.database;
    final maps = await database.query(tableName);
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  Future<int> updateTask(Task task) async {
    final database = await databaseHelper.database;
    return await database.update(
      tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final database = await databaseHelper.database;
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
