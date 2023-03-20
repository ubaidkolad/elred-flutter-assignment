import 'package:elred_flutter_assignment/models/task.dart';
import 'package:flutter/material.dart';

class TaskListProvider extends ChangeNotifier {
  List<TaskDetails> taskLists = [];
  TaskListProvider({required this.taskLists});

  void addTaskToList(TaskDetails task) {
    taskLists.add(task);
    notifyListeners();
  }

  void removeTaskFromList(TaskDetails task) {
    //
  }
}
