import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/detail.dart';
import 'package:sms_parent/models/message.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class Sent extends StatefulWidget {
  final userId;

  const Sent({Key key, this.userId}) : super(key: key);

  ViewPage createState() => new ViewPage();

}

class ViewPage extends State<Sent> {

      @override
      Widget build(BuildContext context) {
       return FutureBuilder<List<Message>>(
        future: new ApiCommonDao().getSentMessageData(widget.userId),
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
          cacheExtent: 200.0,
            itemCount: examList.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (context, index) {
              final item = examList[index];
             
              double c_width = MediaQuery.of(context).size.width * 0.8;
              return Column(
                children: <Widget>[
                  Divider(height: 5.0),
                  ListTile(
                      title: Text(
                        '${item.receiverName}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Serif',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: new Container(
                        width: c_width,
                        height: 25.0,
                        child: new Chip(
                          backgroundColor: Colors.white24,
                          label: new Text(
                            '${item.messageText}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Serif',
                            
                            ),
                            overflow: TextOverflow.ellipsis,
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
