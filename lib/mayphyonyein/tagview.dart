import 'package:flutter/material.dart';

import 'exam.dart' as exam;
import 'chart.dart' as chart;
import 'testFile.dart' as test;


void main(){
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State with SingleTickerProviderStateMixin {

TabController controller;

@override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlue,
        title: new Text("Student Exam Data Report"),
        bottom: new TabBar(
          controller: controller,
          tabs: [
            new Tab(icon: new Icon(Icons.message),text: "ExamData",),
            new Tab(icon: new Icon(Icons.multiline_chart),text: "ChartData",),
           
          ],
        ),
      ),

      body: new TabBarView(
        controller: controller,
        children: [
        new exam.Exam(),
        new test.DomortoryListData(),
         
        ],
      ),

    
    );
  }
}