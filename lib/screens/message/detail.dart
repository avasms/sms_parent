import 'package:flutter/material.dart';
import 'package:sms_parent/models/message.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

class MessageView extends StatefulWidget{
  final Message receiveData;

  MessageView({this.receiveData, String screen,});
StateViewPage createState() => new StateViewPage();
//final ReceiveData mess;
//ReceiveData({this.mess});
  }
  class StateViewPage extends State<MessageView>{

    @override
    Widget build(BuildContext context){
      Message receiveData = widget.receiveData;
      String title=receiveData.senderName;
      if(title == null){
        title = receiveData.receiverName;
      }
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
                        padding: EdgeInsets.only(left: 20.0,bottom: 10.0,top: 10.0),
                        child: Text(
                          "Date",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          
                          //style: Theme.of(context).textTheme.body2
                          
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left:35.0),
                        child: Text(receiveData.sendDate,
                        style: TextStyle(fontFamily: "Serif",fontSize: 16.0),
                          ),
                      ),
                      Divider(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20.0,bottom: 10.0,top: 10.0),
                        child: Text(
                          "Title",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                        
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left:35.0),
                        child: Text(receiveData.title,
                        style: TextStyle(fontFamily: "Zawgyi",fontSize: 16.0),
                          )
                      ),
                      Divider(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20.0,bottom: 10.0,top: 10.0),
                        child: Text("Description",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: "Serif",fontWeight: FontWeight.w600,fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left:25.0),
                        child: new HtmlTextView(
                           data:'${receiveData.messageText}',
                          
                        )
                      ),
                      Divider(
                        height: 10.0,
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

