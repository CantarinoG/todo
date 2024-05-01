import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = "todo.db";
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, _databaseName),
      version: 1,
      onCreate: (db, _) {
        return db.execute(
            "CREATE TABLE Tasks ( id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT, isCompleted INTEGER NOT NULL DEFAULT 0);");
      },
    );
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}
