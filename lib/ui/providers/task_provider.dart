import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/model/task_dm.dart';
import '../utilities/common/remote/firebase_services.dart';

class TaskProvider with ChangeNotifier {
  List<TaskDM> tasks = [];
  DateTime selectedDate = DateTime.now(); // to filter the tasks by its date

  Future<void> getTasksByDate() async {
    try {
      List<TaskDM> allTasks = await FirebaseServices.getTasksByDate(
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day));
      tasks = allTasks;
      notifyListeners();
      log('the provider get the tasks by date ');
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTask(TaskDM newTask) async {
    try {
      // we pyt this timeout in the line below because we are using the app offline
      await FirebaseServices.addTask(newTask).timeout(Duration(seconds: 2),
          onTimeout: () async {
        await getTasksByDate();
      });
    } catch (e) {
      print(e);
    }
  }

  changeSelectedDate(DateTime newDate) async {
    selectedDate = newDate;
    await getTasksByDate();
    log('The selected date changed ');
  }

  deleteTask(String taskId) async {
    try {
      await FirebaseServices.deleteTask(taskId);

      getTasksByDate();
    } catch (e) {
      print(e);
    }
  }
}
