import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/send_message.dart' as second;
import 'package:sms_parent/screens/message/receive_message.dart' as first;
import 'package:sms_parent/screens/message/sent_message.dart'as third;
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/admin.dart';

class MessageScreen extends StatefulWidget{
  final userId;

  const MessageScreen({Key key, this.userId}) : super(key: key);
  _TabBar createState()=>new _TabBar();
}
class _TabBar extends State<MessageScreen> with SingleTickerProviderStateMixin{
TabController controller;
List<AdminStaff> data;
Future<void> getAdminList() async{
       await ApiCommonDao().getAdminManagementList().then((res){
          data = res;
           print(data[0].name);
       });
      
     }
@override
  void initState(){
    // TODO: implement initState
    this.getAdminList();
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
 String _userId = widget.userId;
 print(_userId);
  return Scaffold(
    appBar: AppBar(
            backgroundColor: Colors.indigo.shade700,
            title: new Text(
              AppTranslations.of(context).text("message_menu"),
              style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
            ),
      bottom: new TabBar(
        indicatorColor: Colors.pink,
        labelColor: Colors.white,
        controller: controller,
         tabs: [
           new Tab(child: new Text(AppTranslations.of(context).text("received_menu"),style: TextStyle(fontFamily: 'Myanmar', color: Colors.white)),),
            new Tab(child: new Text(AppTranslations.of(context).text("send_menu"),style: TextStyle(fontFamily: 'Myanmar', color: Colors.white)),),
             new Tab(child: new Text(AppTranslations.of(context).text("sent_menu"),style: TextStyle(fontFamily: 'Myanmar', color: Colors.white)),),
         ],
      ),
    ),
    
    body:TabBarView(
      controller: controller,
      children: <Widget>[
        
        new first.Receive(userId:_userId),
        new second.Send(adminList: data),
        new third.Sent(userId:_userId)
      ],
    ) ,
  
);
}

}
