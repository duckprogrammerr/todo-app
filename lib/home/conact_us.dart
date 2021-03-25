import 'package:flutter/material.dart';
import '../compount/Mydrawer.dart';
import 'home.dart';

class ContactWithMe extends StatefulWidget {
  @override
  _SContactWithMe createState() => _SContactWithMe();
}

class _SContactWithMe extends State<ContactWithMe> {
  var loading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      loading = false;
    });
  }

  Widget build(context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        body: Stack(
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
                margin: EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Open_Drawer(),
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                          height: 200,
                          child: Stack(children: [
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/twitter.png",
                                          width: 40,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "DuckProgrammerr",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/instagram.png",
                                          width: 40,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "DuckProgrammer",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ]))
                    ]))
          ],
        ));
  }
}
