import 'package:flutter/material.dart';
import 'home/home.dart';
import './home/conact_us.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        title: 'Todo',
        debugShowCheckedModeBanner: false,
        home:
            App(), //Directionality(textDirection: TextDirection.rtl, child: App()),
        routes: {
          'home': (context) => App(),
          'About_us': (context) => ContactWithMe()
        });
  }
}
