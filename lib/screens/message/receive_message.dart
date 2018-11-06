import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/detail.dart';
import 'package:sms_parent/models/message.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class Receive extends StatefulWidget {
  final userId;

  const Receive({Key key, this.userId}) : super(key: key);

  ViewPage createState() => new ViewPage();

}

class ViewPage extends State<Receive> {
  Map<int, AnimationController> controllerMaps = new Map();
  Map<int, CurvedAnimation> animationMaps = new Map();

      @override
      Widget build(BuildContext context) {
       return FutureBuilder<List<Message>>(
        future: new ApiCommonDao().getReceivedMessageData(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ReceivedMsgList(examList: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      );
      }

 
     
}

class ReceivedMsgList extends StatelessWidget {
  final examList;

  const ReceivedMsgList({Key key, this.examList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: ListView.builder(
            itemCount: examList.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (context, index) {
              final item = examList[index];
              //Message data=examList[index];
              double c_width = MediaQuery.of(context).size.width * 0.8;
              return Column(
                children: <Widget>[
                  Divider(height: 5.0),
                  ListTile(
                      title: Text(
                        '${item.senderName}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Serif',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: new Container(
                        width: c_width,
                        height: 50.0,
                        child: new Chip(
                          backgroundColor: Colors.white24,
                          label: new HtmlView(
                            data:'${item.messageText}',
                            
                          ),
                        ),
                      ),
                     
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 25.0,
                            child: new Icon(Icons.person),
                           
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> new MessageView(receiveData: item,)
                            ));
                      }
                      ),
                ],
              );
            }),
      );
  }
}
