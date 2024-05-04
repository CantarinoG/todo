import 'package:flutter/material.dart';
import 'package:sqflit_playground/data/dao.dart';

abstract class ObjectProvider<T> with ChangeNotifier {
  ObjectProvider(Dao dao);
  List<T> get objects;
  Future<void> loadObjects();
  Future<void> addObject(T object);
  Future<void> updateObject(T object);
  Future<void> deleteObject(int id);
}
