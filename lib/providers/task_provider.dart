import 'package:flutter/material.dart';
import 'package:sqflit_playground/data/dao.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/object_provider.dart';

class TaskProvider with ChangeNotifier implements ObjectProvider<Task> {
  final Dao<Task> _taskDAO;
  List<Task> tasks = [];

  TaskProvider(this._taskDAO);

  @override
  List<Task> get objects {
    return tasks;
  }

  @override
  Future<void> loadObjects() async {
    tasks = await _taskDAO.readAll();
    notifyListeners();
  }

  @override
  Future<void> addObject(Task task) async {
    await _taskDAO.insert(task);
    await loadObjects();
  }

  @override
  Future<void> updateObject(Task task) async {
    await _taskDAO.update(task);
    await loadObjects();
  }

  @override
  Future<void> deleteObject(int id) async {
    await _taskDAO.delete(id);
    await loadObjects();
  }
}
