import 'package:path/path.dart';
import 'package:sqflit_playground/data/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabaseHelper implements DatabaseHelper {
  static const String _databaseName = "todo.db";
  static final SqfliteDatabaseHelper instance =
      SqfliteDatabaseHelper._privateConstructor();
  Database? _database;

  SqfliteDatabaseHelper._privateConstructor();

  @override
  Future<Database> initDatabase() async {
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

  @override
  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  @override
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}
