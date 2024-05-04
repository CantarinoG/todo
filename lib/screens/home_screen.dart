import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/object_provider.dart';
import 'package:sqflit_playground/screens/task_form_screen.dart';
import 'package:sqflit_playground/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  bool fetchedData = false;
  HomeScreen({super.key});

  void onFabPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ObjectProvider<Task> provider = Provider.of<ObjectProvider<Task>>(context);
    List<Task> tasks = provider.objects;
    if (!fetchedData) {
      fetchedData = true;
      provider.loadObjects();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: Colors.lightBlue[100],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onFabPressed(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) => TaskTile(tasks[index]),
      ),
    );
  }
}
