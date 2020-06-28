import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function removeTask;
  final String taskTitle;
  final Function checkCallBox;
  TaskTile({this.taskTitle,this.isChecked,this.checkCallBox,this.removeTask});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: GestureDetector(
        onLongPress: (){
          removeTask();
        },
        child: Checkbox(
            value:isChecked,
            onChanged: checkCallBox
        ),
      )
    );
  }
}
