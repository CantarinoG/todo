import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/data/dao.dart';
import 'package:sqflit_playground/data/database_helper.dart';
import 'package:sqflit_playground/data/sqflite_database_helper.dart';
import 'package:sqflit_playground/data/task_dao.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/id_provider.dart';
import 'package:sqflit_playground/providers/task_provider.dart';
import 'package:sqflit_playground/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper dbHelper = SqfliteDatabaseHelper.instance;
    Dao<Task> taskDao = TaskDAO(dbHelper);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TaskProvider(taskDao)),
        ChangeNotifierProvider(create: (ctx) => IdProvider()),
      ],
      child: MaterialApp(
        title: 'sqflite Playground',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
