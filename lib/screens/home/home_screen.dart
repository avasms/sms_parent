import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';
import 'package:fluro/fluro.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
//import 'package:flutter/services.dart';
//import 'package:sms_parent/screens/login/login_screen.dart';

class HomeScreen extends StatefulWidget{
@override
_HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

TransitionType transitionType = TransitionType.native;

@override
void initState(){
 super.initState();
 getCode();
 
 }
 
 List<Card> _buildGridCards() {
     List<Card> cards = [
 
        new Card(
         child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 onPressed: (){
                Application.router.navigateTo(context, "login",transition: transitionType);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/noticeboard.jpg'),
             
                    ),
                     ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("noticeboard_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                Application.router.navigateTo(context, "login",transition: transitionType);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/student.jpg'),
             
                    ),
                     ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("child_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                 //Navigator.of(context).pushReplacementNamed("login");
                 String _exam = "exam_menu";
                 Application.router.navigateTo(context, "exam?title=$_exam",transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/exam.jpg'),
             
                    ),
                     ),
                     //Icon(Icons.view_list,size: 100.0,),
                     new Text(AppTranslations.of(context).text("exam_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                Application.router.navigateTo(context, "login",transition: transitionType);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/timetable.jpg'),
             
                    ),
                     ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("timetable_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                 //Navigator.of(context).pushReplacementNamed("login");
                 String _exam = "exam_menu";
                 Application.router.navigateTo(context, "exam?title=$_exam",transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/leave.jpg'),
             
                    ),
                     ),
                     //Icon(Icons.view_list,size: 100.0,),
                     new Text(AppTranslations.of(context).text("leave_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                Application.router.navigateTo(context, "ferry",transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/ferry.jpg'),
             
                    ),
                     ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("ferry_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                 //Navigator.of(context).pushReplacementNamed("login");
                 Application.router.navigateTo(context, "dormitory",transition: transitionType,replace: false);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/hostle.jpg'),
             
                    ),
                     ),
                     //Icon(Icons.view_list,size: 100.0,),
                     new Text(AppTranslations.of(context).text("dormitory_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
                Application.router.navigateTo(context, "login",transition: transitionType);
                 },
                 padding: EdgeInsets.all(5.0),
                 child: Column( // Replace with a Row for horizontal icon + text
                   children: <Widget>[
                     CircleAvatar(
                    radius: 30.0,
                   child: Image(
                   image: AssetImage('images/school.png'),
             
                    ),
                     ),
                    // Icon(Icons.directions_bus,size: 100.0,),
                    new Text(AppTranslations.of(context).text("about_menu"),style: TextStyle(fontFamily: 'Myanmar'))
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
          //leading: Image.asset('images/avasms_login.png'),
          // title: new Text(AppTranslations.of(context).text("test")),
           title: new Image.asset('images/avasms_logo.png'),
           actions: <Widget>[
           
           new PopupMenuButton<SettingMenu>(
             icon: new Icon(Icons.settings,color: Colors.white,),
             itemBuilder: (BuildContext context) => <PopupMenuItem<SettingMenu>>[
               const PopupMenuItem<SettingMenu>(
                 value: SettingMenu.English,
                 child: Text('English')
               ),
               const PopupMenuItem<SettingMenu>(
                 value: SettingMenu.Myanmar,
                 child: Text('Myanmar')
               ),
               const PopupMenuItem<SettingMenu>(
                 value: SettingMenu.Setting,
                 child: Text('Setting')
               ),
               const PopupMenuItem<SettingMenu>(
                 value: SettingMenu.Logout,
                 child: Text('Log Out')
               )
               ],
             
               onSelected: (SettingMenu action) {
               switch (action) {
                 case SettingMenu.English:
                   setState((){
                     application.onLocaleChanged(Locale("en"));
                   }
                   );
                   break;
                  case SettingMenu.Myanmar:
                   setState((){
                     application.onLocaleChanged(Locale("my"));
                   }
                   );
                   break;
                   case SettingMenu.Setting:
                   setState((){
                   //  application.onLocaleChanged(Locale("en"));
                   }
                   );
                   break;
                   case SettingMenu.Logout:
                   setState((){
                   LocalStorage.remove(Config.TOKEN_KEY);
                   Application.router.navigateTo(context, "login",transition: transitionType,replace: true);
                   }
                   );
                   break;
               }
             }
           ),
     
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
 
   void getCode() async{
    //  print(await LocalStorage.get(Config.TOKEN_KEY)+'hello');
   }
}

enum SettingMenu {
  English,
  Myanmar,
  Setting,
  Logout
}

