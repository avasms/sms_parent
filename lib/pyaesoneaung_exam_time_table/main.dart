import 'package:flutter/material.dart';
import 'home.dart';
import 'exam.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/home':(BuildContext context) => new MyHomePage(),
        '/exam':(BuildContext context) => new Exam(),
      },
    );
  }
}
