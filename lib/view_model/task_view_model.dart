import 'package:flutter/material.dart';
import '../model/task_model.dart';

class TaskListViewModel extends ChangeNotifier {
  final TaskListModel _taskListModel;

  TaskListViewModel(this._taskListModel);

  List<Task> get tasks => _taskListModel.tasks;

  void addTask(String title) {
    _taskListModel.addTask(title);
  }

  void toggleTaskStatus(int index) {
    _taskListModel.toggleTaskStatus(index);
  }

  void deleteTask(int index) {
    _taskListModel.deleteTask(index);
  }
}
