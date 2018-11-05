import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/message/detail.dart';
import 'package:sms_parent/screens/message/viewdata.dart';
class Sent extends StatefulWidget {
  SentView createState() => new SentView();
}

class SentView extends State<Sent> with TickerProviderStateMixin{
Map<int, AnimationController> controllerMaps = new Map();
  Map<int, CurvedAnimation> animationMaps = new Map();
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     receives.forEach((ReceiveData receives) {
      AnimationController _animationController = AnimationController(
          duration: Duration(milliseconds: 200), vsync: this);
      CurvedAnimation _animation = new CurvedAnimation(
          parent: _animationController, curve: Curves.easeIn);
      controllerMaps[receives.id] = _animationController;
      _animationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _DetailHero(receives);


        }
      });
      animationMaps[receives.id] = _animation;
    });
  }

  Future _DetailHero (ReceiveData receiveData) async {
AnimationController _controller =controllerMaps[receiveData.id];
CurvedAnimation _curvedAnimation=animationMaps[receiveData.id];
   Navigator.push(
    context, MaterialPageRoute(
    builder: (context){
   return MessageView(
  receiveData: receiveData,
   animation: _curvedAnimation,
     onAction: (){
       Navigator.pop(context);
     },
   );
    },fullscreenDialog: true)).then((value){
   Future.delayed(Duration(milliseconds:500)).then((v){
_controller.reverse();
   });
});

  }

  final sendMessage = new Container(
    child: ListView.builder(
        itemCount: receives.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position) {
          final item = receives[position];
          ReceiveData data=receives[position];
          double c_width = MediaQuery.of(context).size.width * 0.8;
          return Column(
            children: <Widget>[
              Divider(height: 5.0),
              ListTile(
                  title: Text(
                    '${item.recipient}',
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
                        '${item.message}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Serif',
                        
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  /*subtitle: Text(
                    '${item.message}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),*/
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
                        builder: (context)=> new MessageView(receiveData: data,)
                        ));
                  }
                  ),
            ],
          );
        }),
  );

  @override
  Widget build(BuildContext context) {
    return sendMessage;
  }
}
