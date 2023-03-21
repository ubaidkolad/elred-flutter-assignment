import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:flutter/material.dart';

enum TaskType { Personal, Business }

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

  Future<bool> deleteTaskFromDatabase(String taskId) async {
    try {
      await usersCollection
          .doc(auth.currentUser!.uid)
          .collection('tasks')
          .doc(taskId)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  int getPersonalOrBusinessTasks(
      List<TaskDetails> taskDetails, bool shouldGetPersonalTasks) {
    if (taskDetails.length == 0) {
      return 0;
    }
    List<TaskDetails> tasks = [];
    for (var i = 0; i < taskDetails.length; i++) {
      if (shouldGetPersonalTasks) {
        if (taskDetails[i].taskType == TaskType.Personal.name) {
          tasks.add(taskDetails[i]);
        }
      } else {
        if (taskDetails[i].taskType == TaskType.Business.name) {
          tasks.add(taskDetails[i]);
        }
      }
    }
    return tasks.length;
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
