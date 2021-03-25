import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoApp/home/add_task.dart';
import 'package:todoApp/database/database.dart';
import 'package:todoApp/database/task.dart';
import 'package:todoApp/database/task_api.dart';

class Tasks extends StatefulWidget {
  final String title_page;

  Tasks(
    this.title_page,
  );
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var tasksList = [];
  getAllTasks() async {
    tasksList.clear();
    var res = await TaskApi().getTasks(widget.title_page);
    res.forEach((e) {
      setState(() {
        tasksList.add(e);
      });
    });
  }

  @override
  void initState() {
    getAllTasks();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskAddPage(widget.title_page),
              ));
            }),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/sd.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      color: Color(0XFF5b5b5b),
                      icon: Icon(Icons.keyboard_backspace),
                      iconSize: 40,
                      onPressed: () {
                        Navigator.of(context).pushNamed("home");
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/' + widget.title_page + '.png',
                        width: 90,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${tasksList.length}"),
                              Text(
                                widget.title_page,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  ),
                  tasksList.length >= 1
                      ? Container(
                          height: MediaQuery.of(context).size.height - 300,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: tasksList.length,
                              itemBuilder: (BuildContext context, int _task) {
                                return Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "${tasksList[_task]["task"]}",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color:
                                                tasksList[_task]["isDone"] == 1
                                                    ? Color(0xFF999999)
                                                    : Colors.black,
                                            decoration:
                                                tasksList[_task]["isDone"] == 1
                                                    ? TextDecoration.lineThrough
                                                    : null,
                                            decorationThickness: 2.0),
                                      )),
                                      Row(children: [
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.redAccent,
                                            iconSize: 30,
                                            onPressed: () {
                                              setState(() {
                                                TaskApi().deleteTask(
                                                    tasksList[_task]["id"]);
                                                tasksList
                                                    .remove(tasksList[_task]);
                                              });
                                            }),
                                        IconButton(
                                            icon: Icon(tasksList[_task]
                                                        ["isDone"] ==
                                                    1
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            color:
                                                tasksList[_task]["isDone"] == 1
                                                    ? Color(0xFF5EB4FD)
                                                    : Colors.black,
                                            iconSize: 30,
                                            // activeColor: Color(0xFFc8c6a7),
                                            // value: Toggle_,
                                            onPressed: () {
                                              setState(() {
                                                var _ =
                                                    Map.of(tasksList[_task]);
                                                var data = Task(
                                                    id: _["id"],
                                                    task: _["task"],
                                                    isDone: _["isDone"],
                                                    catalog: _["catalog"]);
                                                var isDone =
                                                    tasksList[_task]["isDone"];

                                                if (isDone == 1) {
                                                  isDone = 0;
                                                  data.isDone = isDone;
                                                  _["isDone"] = isDone;
                                                  print(data);
                                                  TaskApi().updateTask(data);

                                                  tasksList
                                                      .remove(tasksList[_task]);
                                                  tasksList.add(_);
                                                } else {
                                                  isDone = 1;
                                                  data.isDone = isDone;
                                                  _["isDone"] = isDone;
                                                  TaskApi().updateTask(data);

                                                  tasksList
                                                      .remove(tasksList[_task]);
                                                  tasksList.add(_);
                                                }
                                                // tasksList.remove(tasksList[_task]);
                                                // tasksList.add(map);
                                              });
                                            }),
                                      ]),
                                    ],
                                  ),
                                );
                              }))
                      : Container(
                          margin: EdgeInsets.only(top: 200),
                          child: Center(
                              child: Text(
                            "No Tasks",
                            style: TextStyle(fontSize: 29),
                            textAlign: TextAlign.center,
                          )))
                ],
              ),
            )
          ],
        )));
  }
}
