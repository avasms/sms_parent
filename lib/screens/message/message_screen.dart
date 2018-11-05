import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/sendmessage.dart' as first;
import 'package:sms_parent/screens/message/receive.dart' as second;
import 'package:sms_parent/screens/message/sent.dart'as third;
class MessageScreen extends StatefulWidget{
  _TabBar createState()=>new _TabBar();
}
class _TabBar extends State<MessageScreen> with SingleTickerProviderStateMixin{
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
           new Tab(text:'Send'),
           new Tab(text:'Receive'),
           new Tab(text:'Sent'),
           //new Tab(icon: new Icon(Icons.send),text:'Send',),
           //new Tab(icon: new Icon(Icons.view_list),text: 'View',),
         ],
      ),
    ),
    
    body:TabBarView(
      controller: controller,
      children: <Widget>[
        new first.Send(),
        new second.Receive(),
        new third.Sent(),
        
      ],
    ) ,
  ),
);
}
}
