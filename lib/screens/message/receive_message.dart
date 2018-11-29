import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/detail.dart';
import 'package:sms_parent/models/message.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

class Receive extends StatefulWidget {
  final userId;

  const Receive({Key key, this.userId}) : super(key: key);

  ViewPage createState() => new ViewPage();
}

class ViewPage extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Message>>(
      future: new ApiCommonDao().getReceivedMessageData(widget.userId),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ReceivedMsgList(examList: snapshot.data,userId: widget.userId)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ReceivedMsgList extends StatelessWidget {
  final examList;
  final userId;
  const ReceivedMsgList({Key key, this.examList, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: ListView.builder(
          cacheExtent: 200.0,
          itemCount: examList.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, index) {
            Message item = examList[index];

            var string = item.messageText;
            if (string.length>40){
              string=string.substring(0,40)+'...';
            print(string.substring(0,20));
             } // 'artlang'
            
            double c_width = MediaQuery.of(context).size.width * 0.8;
            return Column(

              children: <Widget>[
                Divider(height: 2.0),
                new Container(
                  color: item.status=='UNREAD'?Colors.blueGrey[100]:Colors.white,
                  child:  ListTile(

                    title: Text(
                      '${item.senderName}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Zawgyi',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: new Container(
                      padding: EdgeInsets.all(2.0),
                      child: new Container(
                        child: new HtmlTextView(
                          data: '${string.replaceAll('&nbsp;', ' ').toString()}',
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
                      new ApiCommonDao().updateReadMessageStatus(item.id.toString(),userId);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new MessageView(
                                receiveData: item
                              )));
                    }),
                ),
               
              ],
            );
          }),
    );
  }
}
