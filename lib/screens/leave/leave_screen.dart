import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/screens/leave/create_leave.dart';
import 'package:sms_parent/screens/leave/viewLeave.dart';


class LeaveScreen extends StatefulWidget{
  _LeaveScreenPage createState()=>new _LeaveScreenPage();
}
class _LeaveScreenPage extends State<LeaveScreen> with SingleTickerProviderStateMixin{
TabController controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new TabController(vsync: this,length: 3);
  }
  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      controller.dispose();
    }
@override
Widget build(BuildContext context){
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Tab Bar'),
      
      backgroundColor:Colors.blue ,
      bottom: new TabBar(
        indicatorColor: Colors.pink,
        controller: controller,
         tabs: <Widget>[
           new Tab(text:'Create Leave'),
           new Tab(text:'View Leave'),
         ],
      ),
    ),
    
    body:TabBarView(
      controller: controller,
      children: <Widget>[
        new CreateLeaveScreen(),
        new ViewLeaveScreen(),        
      ],
    ) ,
  ),
);
}
}
