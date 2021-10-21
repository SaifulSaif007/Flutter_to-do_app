import 'package:flutter/cupertino.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Task> _tasklist = [];

  List<Task> get taskList => _tasklist;

  void getTasks() async {
    _tasklist = await _dbHelper.getTasks();
    notifyListeners();
  }
}
