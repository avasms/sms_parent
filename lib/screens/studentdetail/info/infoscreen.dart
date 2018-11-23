import 'package:flutter/material.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/studentInfo.dart';

class InfoScreen extends StatefulWidget {
  final student;
  InfoScreen({this.student});
  _Info createState() => new _Info();
}

class _Info extends State<InfoScreen> {
  @override
  Widget build(BuildContext context){
    StudentInfo stud=widget.student;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Row(children: <Widget>[
                        new Container(
                          width: 150.0,
                          padding: EdgeInsets.all(5.0),
                          child: new Text('Studetn ID'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.id}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          width: 150.0,
                          padding: EdgeInsets.all(5.0),
                          child: new Text('School Name'),
                        ),
                        new Container(
                          child: new Text('${stud.schoolName}'),
                          padding: EdgeInsets.all(5.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          width: 150.0,
                          padding: EdgeInsets.all(5.0),
                          child: new Text('Guest ID'),
                        ),
                        new Container(
                          child: new Text('${stud.guestsNo}'),
                          padding: EdgeInsets.all(5.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          width: 150.0,
                          padding: EdgeInsets.all(5.0),
                          child: new Text('Student Name'),
                        ),
                        new Container(
                          child: new Text('${stud.name}'),
                          padding: EdgeInsets.all(5.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Nrc'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.nrc}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Birthday'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.birthday}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Admission No'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.admissionNo}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Race'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.race}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Religion'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.religion}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Citizen'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.citizens}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('HomeTown'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.homeTown}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          width: 150.0,
                          child: new Text('Gender'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.gender}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          width: 150.0,
                          padding: EdgeInsets.all(5.0),
                          child: new Text('Current Address'),
                        ),
                        new Container(
                          padding: EdgeInsets.all(5.0),
                          child: new Text('${stud.currentAdress}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      
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