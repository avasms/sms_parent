import 'package:flutter/material.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/studentInfo.dart';
import 'package:sms_parent/util/app_translation.dart';

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
      body:new Card(
        margin: EdgeInsets.only(left: 6.0,top: 5.0,right: 5.0,bottom: 10.0),
      child:
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        new Container(
                              width: 150.0,
                              padding: EdgeInsets.only(left:4.0),
                              child: new Text(
                                  AppTranslations.of(context).text("student_id"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        //new Text('-'),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.studentNo==null ? '':stud.studentNo)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black),),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("school_name"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          child: new Text('${(stud.schoolName==null ? '':stud.schoolName)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                          padding: EdgeInsets.all(10.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("guest_id"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          child: new Text('${(stud.guestsNo==null ? '':stud.guestsNo)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                          padding: EdgeInsets.all(10.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("student_name"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          child: new Text('${(stud.name==null ? '':stud.name)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                          padding: EdgeInsets.all(10.0),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("birthday"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.birthday==null ? '':stud.birthday)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("nrc"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.nrc==null ? '':stud.nrc)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("gender"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.gender==null ? '':stud.gender)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("race"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.race==null ? '':stud.race)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("religion"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.religion==null ? '':stud.religion)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("citizen"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.citizens==null ? '':stud.citizens)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("home_town"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.homeTown==null ? '':stud.homeTown)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("admission_no"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.admissionNo==null ? '':stud.admissionNo)}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                              width: 150.0,
                              child: new Text(
                                  AppTranslations.of(context).text("current_address"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Text('${(stud.currentAdress==null)?'':stud.currentAdress}',style: TextStyle(fontFamily: 'Zawgyi',fontSize: 17.0,fontWeight: FontWeight.w500,color: Colors.black)),
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
    ),
    );
  }
  }