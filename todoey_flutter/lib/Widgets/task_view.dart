import 'package:flutter/material.dart';
import 'package:todoeyflutter/Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/Models/task_data.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(

            taskTitle: taskdata.task[index].name,
            isChecked: taskdata.task[index].isDone,
            checkCallBox: (bool isCheckedState) {
              setState(
                () {
                  taskdata.updateTask(taskdata.task[index]);
                },
              );
            },
            removeTask: (){
              setState(() {
                taskdata.removeTask(index);
              });
            },
          );
        },
        itemCount: taskdata.task.length,
      );
    });
  }
}
