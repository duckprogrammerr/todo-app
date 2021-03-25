import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoApp/home/tasks_page.dart';
import '../compount/Mydrawer.dart';
// import '' as data;
// import 'dart:convert';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

class MyHomePage extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        body: DefaultTextStyle(
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0XFF5b5b5b)),
            child: Stack(children: [
              // background image Start
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/sd.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              // background image End

              // Body
              Container(
                  // body settings Start

                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  // body settings End

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Icon To open Drawer Start
                      Open_Drawer(),
                      // Icon To open Drawer End
                      // the SizedBox use for one case  is to be empty :>
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello Freind",
                            style: TextStyle(fontSize: 30),
                          ),
                          Image.asset(
                            "assets/personal.png",
                            width: 80,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                          child: Center(
                        child: Column(children: <Widget>[
                          Todo_con("today"),
                          Todo_con("personal"),
                          Todo_con("work"),
                          Todo_con("shopping"),
                        ]),
                      ))
                    ],
                  )), //Body
            ])));
  }
}

// class to solve Scafold.of() Error
class Open_Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.topLeft,
        iconSize: 50,
        color: Color(0XFF5b5b5b),
        icon: Icon(
          Icons.subject,
        ),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        });
  }
}

class Todo_con extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final card_title;
  // ignore: non_constant_identifier_names
  Todo_con(this.card_title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Tasks(card_title)));
        },
        child: Card(
            margin: EdgeInsets.only(top: 20),
            elevation: 30.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/' + card_title + '.png',
                      width: 90,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      card_title,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ))));
  }
}
