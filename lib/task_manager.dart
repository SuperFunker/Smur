import 'package:flutter/foundation.dart';
import 'package:smapp/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class TaskManager extends ChangeNotifier{
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(Task taskToAdd){
    _tasks.add(taskToAdd);
    notifyListeners();
  }
  int getNextId()
  {
    return _tasks.last.id + 1;
  }
  void updateTask(Task taskToUpdate){
    final index = _tasks.indexWhere((task) => task.id == taskToUpdate.id);
  }
  void removeTask(int taskId){
    _tasks.removeWhere((task) => task.id == taskId);
  }
  Future<void> fetchTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Fetch the saved task data from local storage
      final taskDataString = prefs.getStringList('tasks');

      if (taskDataString != null) {
        final decodedData = taskDataString.map((data) => json.decode(data));
        _tasks.clear();
        _tasks.addAll(decodedData.map((data) => Task.fromJson(data)));
      }

      notifyListeners();
    } catch (error) {
      print('Error fetching tasks: $error');
    }
  }

  Future<void> saveTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Convert the tasks to a format suitable for storing in local storage
      final taskData = tasks.map((task) => task.toJson()).toList();
      final taskDataString = taskData.map((data) => json.encode(data)).toList();

      // Save the task data to local storage
      await prefs.setStringList('tasks', taskDataString);

      notifyListeners();
    } catch (error) {
      print('Error saving tasks: $error');
    }
  }

}