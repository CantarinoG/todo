import 'package:flutter/material.dart';
import 'package:sqflit_playground/data/task_dao.dart';
import 'package:sqflit_playground/models/task.dart';

class TaskProvider with ChangeNotifier {
  final TaskDAO _taskDAO;
  List<Task> tasks = [];

  TaskProvider(this._taskDAO);

  Future<void> loadTasks() async {
    tasks = await _taskDAO.readAll();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _taskDAO.insert(task);
    await loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskDAO.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _taskDAO.deleteTask(id);
    await loadTasks();
  }
}
