import 'package:sqflit_playground/data/dao.dart';
import 'package:sqflit_playground/data/database_helper.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO implements Dao<Task> {
  final DatabaseHelper databaseHelper;
  final String tableName;

  TaskDAO(this.databaseHelper, this.tableName);

  @override
  Future<int> insert(Task task) async {
    final database = await databaseHelper.database;
    return await database.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Task>> readAll() async {
    final database = await databaseHelper.database;
    final maps = await database.query(tableName);
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  @override
  Future<int> update(Task task) async {
    final database = await databaseHelper.database;
    return await database.update(
      tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final database = await databaseHelper.database;
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
