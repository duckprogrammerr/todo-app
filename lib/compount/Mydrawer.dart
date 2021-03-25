import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        child: SizedBox(
          width: 300,
          child: Drawer(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/personal.png",
                      width: 95,
                    )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('home');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    "About us",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('About_us');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
