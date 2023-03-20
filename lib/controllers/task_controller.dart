import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:flutter/material.dart';

class TaskController {
  Future<bool> addTaskToDatabase(TaskDetails taskDetails) async {
    try {
      await usersCollection
          .doc(auth.currentUser!.uid)
          .collection('tasks')
          .doc(taskDetails.taskId)
          .set(taskDetails.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateTaskInDatabase(TaskDetails taskDetails) async {
    try {
      await usersCollection
          .doc(auth.currentUser!.uid)
          .collection('tasks')
          .doc(taskDetails.taskId)
          .update(taskDetails.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TaskDetails>> getUserTasks() async {
    var tasksDocs = await usersCollection
        .doc(auth.currentUser!.uid)
        .collection('tasks')
        .get();
    List<TaskDetails> tasks = tasksDocs.docs
        .map((task) => TaskDetails.fromJson(task.data()))
        .toList();
    return tasks;
  }

  int getCompletedTasks(List<TaskDetails> taskDetails) {
    List<TaskDetails> completedTasks = [];
    for (var i = 0; i < taskDetails.length; i++) {
      if (taskDetails[i].completed) {
        completedTasks.add(taskDetails[i]);
      }
    }
    return completedTasks.length;
  }
}
