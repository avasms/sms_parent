import 'package:flutter/material.dart';
import 'package:sms_parent/screens/leave/leavedata.dart';
import 'package:sms_parent/models/leave.dart';


class MessageView extends StatefulWidget{
  final Leave data;
  

  MessageView({this.data});
StateViewPage createState() => new StateViewPage();

  }
  class StateViewPage extends State<MessageView>{

    @override
    Widget build(BuildContext context){
    Leave receiveData = widget.data;
    final title=receiveData.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          "Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                          
                          
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        child: Text(receiveData.name,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,)
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text("Description",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                            //style: Theme.of(context).textTheme.body2
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 14.0, right: 14.0, bottom: 14.0),
                        child: Text(receiveData.description,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          ),
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          "SenderName",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                          
                          
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        child: Text(receiveData.adminName,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,)
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text("From Date",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                            //style: Theme.of(context).textTheme.body2
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 14.0, right: 14.0, bottom: 14.0),
                        child: Text(receiveData.dateFromDate,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          ),
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          "To Date",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                          
                          
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        child: Text(receiveData.dateToDate,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,)
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
  }

