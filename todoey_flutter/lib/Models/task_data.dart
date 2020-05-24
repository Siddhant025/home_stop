import 'package:flutter/material.dart';
import 'package:todoeyflutter/Models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> task = [
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Milk'),
    Task(name: 'Buy butter'),
  ];

  void addTask({String name}){
    final t=Task(name: name);
    task.add(t);
    notifyListeners();
  }
  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void removeTask(int index){
    task.removeAt(index);
    notifyListeners();
  }
}