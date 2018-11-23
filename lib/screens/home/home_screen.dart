import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';
import 'package:fluro/fluro.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/util/dbhelper.dart';
import 'package:connectivity/connectivity.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TransitionType transitionType = TransitionType.native;
  String _parentId;
  String _userId;

  @override
  void initState() {
    super.initState();
    getCode().then((res) {
      _parentId = res;
    });
    getUserCode().then((res) {
      _userId = res;
    });
    _checkInternet();
  }

  void _checkInternet() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
     
     showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
           
            title: new Text("Check Internet"),
            content: new Text("Please Open Mobile Data or Wifi"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () => exit(0),
              ),
            ],
          );
        },
     );
    }
  }

  List<Card> _buildGridCards() {
    List<Card> cards = [
      new Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Application.router.navigateTo(context, "notice",
                      transition: transitionType, replace: false);
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child: Image(
                        image: AssetImage('images/noticeboard.jpg'),
                      ),
                    ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(
                        AppTranslations.of(context).text("noticeboard_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Application.router.navigateTo(
                      context, "message?userId=$_userId",
                      transition: transitionType, replace: false);
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child: Image(
                        image: AssetImage('images/message.jpg'),
                      ),
                    ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("message_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: (){
                  
                  Application.router.navigateTo(context, "student?parentId=$_parentId&userId=$_userId&screenType="+Config.STUDENT_SCREEN,transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/student.jpg'),
             
                    )),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("child_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: () {
               
                Application.router.navigateTo(context, "student?parentId=$_parentId&userId=$_userId&screenType="+Config.EXAM_SCREEN,transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 33.0,
                   child: Image(
                   image: AssetImage('images/exam.jpg'),
 
                    )),
                    new Text(AppTranslations.of(context).text("exam_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(

             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: (){
                Application.router.navigateTo(context, "student?parentId=$_parentId&userId=$_userId&screenType="+Config.GRADE_SCREEN,transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 45.0,
                   child: Image(
                   image: AssetImage('images/grade_menu.jpg'),
                    )),
                    new Text(AppTranslations.of(context).text("grade_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: (){
                 Application.router.navigateTo(context, "student?parentId=$_parentId&userId=$_userId&screenType="+Config.TIMETABLE_SCREEN,transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/timetable.jpg'),
  
                    )),
                    new Text(AppTranslations.of(context).text("timetable_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: () {
                 Application.router.navigateTo(context, "student?parentId=$_parentId&userId=$_userId&screenType="+Config.LEAVE_SCREEN,transition: transitionType,replace: false);
               
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/leave.jpg'),
                     )),
                    new Text(AppTranslations.of(context).text("leave_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Application.router.navigateTo(context, "ferry",
                      transition: transitionType, replace: false);
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child: Image(
                        image: AssetImage('images/ferry.jpg'),
                      ),
                    ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("ferry_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Application.router.navigateTo(context, "dormitory",
                      transition: transitionType, replace: false);
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child: Image(
                        image: AssetImage('images/hostle.jpg'),
                      ),
                    ),
                    new Text(AppTranslations.of(context).text("dormitory_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      new Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Application.router.navigateTo(context, "aboutSchool",
                      transition: transitionType, replace: false);
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child: Image(
                        image: AssetImage('images/school.png'),
                      ),
                    ),
                    new Text(AppTranslations.of(context).text("about_menu"),
                        style: TextStyle(fontFamily: 'Myanmar'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo.shade700,
        title: new Image.asset('images/avasms_logo.png'),
        actions: <Widget>[
          new PopupMenuButton<SettingMenu>(
              icon: new Icon(
                Icons.settings,
                color: Colors.white,
              ),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<SettingMenu>>[
                    const PopupMenuItem<SettingMenu>(
                        value: SettingMenu.English, child: Text('English')),
                    const PopupMenuItem<SettingMenu>(
                        value: SettingMenu.Myanmar, child: Text('Myanmar')),
                    const PopupMenuItem<SettingMenu>(
                        value: SettingMenu.Setting, child: Text('Setting')),
                    const PopupMenuItem<SettingMenu>(
                        value: SettingMenu.Logout, child: Text('Log Out'))
                  ],
              onSelected: (SettingMenu action) {
                switch (action) {
                  case SettingMenu.English:
                    setState(() {
                      application.onLocaleChanged(Locale("en"));
                    });
                    break;
                  case SettingMenu.Myanmar:
                    setState(() {
                      application.onLocaleChanged(Locale("my"));
                    });
                    break;
                  case SettingMenu.Setting:
                    setState(() {
                      Application.router.navigateTo(
                          context, "setting?userId=$_userId",
                          transition: transitionType, replace: false);
                    });
                    break;
                  case SettingMenu.Logout:
                    setState(() {
                      deleteDBdata();
                      LocalStorage.remove(Config.TOKEN_KEY);
                      Application.router.navigateTo(context, "login",
                          transition: transitionType, replace: true);
                    });
                    break;
                }
              }),
        ],
      ),

      body: new GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.0),
        children: _buildGridCards(),
      ),
      //backgroundColor: Colors.grey,
    );
  }

  getCode() async {
    return await LocalStorage.get(Config.USER_RELATED_ID);
  }

  getUserCode() async {
    return await LocalStorage.get(Config.USER_ID);
  }

  void deleteDBdata() async {
    var db = new DBHelper();
    await db.deleteData();
  }
}

enum SettingMenu { English, Myanmar, Setting, Logout }
