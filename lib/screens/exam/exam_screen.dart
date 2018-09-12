import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';
//import 'package:sms_parent/screens/login/login_screen.dart';

class ExamScreen extends StatefulWidget{
final title;

@override
_ExamScreenState createState() => new _ExamScreenState();
  // In the constructor, require a Todo
  ExamScreen({Key key, @required this.title}) : super(key: key);
}

class _ExamScreenState extends State<ExamScreen>{

List<Card> _buildGridCards() {
    List<Card> cards = [
      new Card(
        child: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                Navigator.of(context).pushReplacementNamed("login");
                },
                padding: EdgeInsets.all(10.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                   radius: 40.0,
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
                Navigator.of(context).pushReplacementNamed("login");
                },
                padding: EdgeInsets.all(10.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    CircleAvatar(
                   radius: 40.0,
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
      
    ];

    return cards;
  }


@override
 Widget build(BuildContext context) {

   return new Scaffold(
        appBar: new AppBar(
         
         backgroundColor: Colors.lightBlue,
          title: Text(AppTranslations.of(context).text(widget.title),style: TextStyle(fontFamily: 'Myanmar'),),
          actions: <Widget>[
          new PopupMenuButton<SettingMenu>(
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
              }
            }
          ),
    
          ],
        ),

     body: new GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: _buildGridCards(),
        ),
        //backgroundColor: Colors.grey,
        );
   
 }
}

enum SettingMenu {
  English,
  Myanmar,
  Setting
}

