import 'package:flutter/material.dart';
import 'package:todoApp/database/database.dart';
import 'package:todoApp/database/task.dart';
import 'package:todoApp/database/task_api.dart';
import 'package:todoApp/home/tasks_page.dart';

class TaskAddPage extends StatefulWidget {
  final category;
  TaskAddPage(this.category);

  @override
  _TaskAddPageState createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  final TextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/sd.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        color: Color(0XFF5b5b5b),
                        icon: Icon(Icons.keyboard_backspace),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      "Add New",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Task",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 25),
                      decoration: InputDecoration(
                        hintText: "Task",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 3.0),
                        ),
                      ),
                      controller: TextController,
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              onPressed: () async {
                                if (TextController.text != '') {
                                  var todoObject = Task();
                                  todoObject.task = TextController.text;
                                  todoObject.catalog = widget.category;
                                  todoObject.isDone = 0;
                                  var _taskApi = TaskApi();

                                  var res =
                                      await _taskApi.insertTask(todoObject);

                                  //print(res);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Tasks(widget.category)),
                                  );
                                }
                              },
                              child: Center(
                                widthFactor: 4,
                                heightFactor: 1.2,
                                child: Text(
                                  "Add Task",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Colors.amber,
                              padding: EdgeInsets.all(10),
                            )))
                  ]))
        ]));
  }
}
