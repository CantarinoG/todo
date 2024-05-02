import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/data/sqflite_database_helper.dart';
import 'package:sqflit_playground/data/task_dao.dart';
import 'package:sqflit_playground/providers/id_provider.dart';
import 'package:sqflit_playground/providers/task_provider.dart';
import 'package:sqflit_playground/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SqfliteDatabaseHelper.instance.database,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          return const Center(
            child: Text("Ocorreu algum erro!"),
          );
        } else {
          final database = snapshot.data!;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (ctx) => TaskProvider(TaskDAO(database))),
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
      },
    );
  }
}
