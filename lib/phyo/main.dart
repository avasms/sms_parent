import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(new MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MyApp> {
  String textvalue = 'Hello world';
  String m="hi";
  FirebaseMessaging message = new FirebaseMessaging();

  Future showNotification(Map<String, dynamic> msg) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Notification"),
              content: Text(msg.toString()),
              actions: <Widget>[
                new FlatButton(
                  child: Text('OK'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                  child: Text('Cancle'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
  Future convertMessage(Map<String,dynamic> message){
    print(message);
    m=message.toString();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    message.configure(
      onLaunch: (Map<String, dynamic> msg) {
      print("OnLaunch called $msg");
    }, onResume: (Map<String, dynamic> msg) {
      print("onResume called $msg");
      //m=msg.toString();
      //showNotification(msg);
      
    }, onMessage: (Map<String, dynamic> msg) {
      showNotification(msg);
      //convertMessage(msg);
      print("onMessage called: $msg");
    });
    
    message.requestNotificationPermissions(const IosNotificationSettings(
      sound: true,
      alert: true,
      badge: true,
    ));
    message.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
      print("Ios Setting Register");
    });
    message.getToken().then((token) {
      update(token);
    });
  }

  update(String token) {
    print(token);
    textvalue = token;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: textvalue,
        home: Scaffold(
          appBar: AppBar(
            title: Text(textvalue),
          ),
          body: new Center(
            child: Text(m),
          ),
        ));
  }
}
