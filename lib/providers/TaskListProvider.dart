import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:flutter/material.dart';

class TaskListProvider with ChangeNotifier {
  List<TaskDetails> taskLists = [];
  bool loading = true;
  TaskListProvider() {
    loadTaskListFromDatabase();
  }

  void loadTaskListFromDatabase() async {
    taskLists = await tasksController.getUserTasks();
    loading = false;
    notifyListeners();
  }

  void addTaskToList(TaskDetails task) {
    taskLists.add(task);
    notifyListeners();
  }

  void removeTaskFromList(TaskDetails task) {
    //
  }
}
