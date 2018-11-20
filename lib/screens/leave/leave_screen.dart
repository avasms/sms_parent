import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/screens/leave/create_leave.dart';
import 'package:sms_parent/screens/leave/viewLeave.dart';
import 'package:sms_parent/util/app_translation.dart';


class LeaveScreen extends StatefulWidget{
  final userId,studentId,studentName;
  const LeaveScreen({Key key, this.userId, String this.studentId, String this.studentName}) : super(key: key);
  _LeaveScreenPage createState()=>new _LeaveScreenPage();
}
class _LeaveScreenPage extends State<LeaveScreen> with SingleTickerProviderStateMixin{
TabController controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new TabController(vsync: this,length: 3);
    print(widget.studentName);
  }
  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      controller.dispose();
    }
@override
Widget build(BuildContext context){

  return Scaffold(
    appBar: AppBar(
            backgroundColor: Colors.indigo.shade700,
            title: new Text(
              AppTranslations.of(context).text("leave_menu"),
              style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
            ),
     
      bottom: new TabBar(
        indicatorColor: Colors.pink,
        controller: controller,
         tabs: <Widget>[
           new Tab(child: new Text(AppTranslations.of(context).text("create_leave_menu"),style: TextStyle(fontFamily: 'Myanmar', color: Colors.white,fontSize: 13.0)),),
            new Tab(child: new Text(AppTranslations.of(context).text("view_leave_menu"),style: TextStyle(fontFamily: 'Myanmar', color: Colors.white,fontSize: 13.0)),),
         ],
      ),
    ),
    
    body:TabBarView(
      controller: controller,
      children: <Widget>[
        new CreateLeaveScreen(studentId:widget.studentId,studentName:widget.studentName,userId:widget.userId),
        new ViewLeaveScreen(userId:widget.userId,studentId:widget.studentId,studentName:widget.studentName),        
      ],
    ) ,
);
}
}
