import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/Models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (newValue){
                  name=newValue;
                },
                textAlign: TextAlign.center,
                autofocus: true,
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              widget: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              onpress: (){
                //can't use task.add() inbuilt method as it will always give an error.
                Provider.of<TaskData>(context,listen: false).addTask(name: name);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  @override
  FlatButton({@required this.widget, this.onpress});
  final Widget widget;
  final Function onpress;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: widget,
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 310,
        height: 50,
      ),
      fillColor: Colors.blueAccent,
    );
  }
}
