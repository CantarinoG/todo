import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflit_playground/models/task.dart';

class TaskFormScreen extends StatelessWidget {
  Task? task;
  TaskFormScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String description = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo Form"),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
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
