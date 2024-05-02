import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/id_provider.dart';
import 'package:sqflit_playground/providers/task_provider.dart';

class TaskFormScreen extends StatelessWidget {
  Task? task;
  TaskFormScreen({super.key, this.task});

  void _onSubmit(BuildContext context, String title, String description) async {
    final TaskProvider provider =
        Provider.of<TaskProvider>(context, listen: false);
    if (task == null) {
      //Adding
      final int uniqueId =
          Provider.of<IdProvider>(context, listen: false).generate();
      final Task newTask = Task(
          id: uniqueId, title: title, description: description, isCompleted: 0);
      await provider.addTask(newTask);
    } else {
      //Updating
      final Task updatedTask = Task(
          id: task!.id,
          title: title,
          description: description,
          isCompleted: task!.isCompleted);
      await provider.updateTask(updatedTask);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String title = "";
    String description = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Form"),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _onSubmit(context, title, description);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Confirmar"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
