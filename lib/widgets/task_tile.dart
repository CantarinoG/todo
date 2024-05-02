import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile(this.task, {super.key});

  void _onChecked(context) {
    task.toggleCompleted();
    Provider.of<TaskProvider>(context, listen: false).updateTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        color: Colors.blueGrey[50],
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration:
                  task.isCompleted != 0 ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  _onChecked(context);
                },
                icon: Icon(Icons.check),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
