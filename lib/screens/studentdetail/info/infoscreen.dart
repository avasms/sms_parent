import 'package:flutter/material.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/studentInfo.dart';

class InfoScreen extends StatefulWidget {
  final studentId;
  InfoScreen({this.studentId});
  _Info createState() => new _Info();
}

class _Info extends State<InfoScreen> {
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: FutureBuilder<StudentInfo>(
        future: new ApiCommonDao().viewStudentInfo(widget.studentId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ViewInfo(stud: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
   );
    
  }
}
class ViewInfo extends StatelessWidget{
  StudentInfo stud;
  ViewInfo({this.stud});
  @override
  Widget build(BuildContext context){
    //StudentInfo info=Widget.stud;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Studetn ID'),
                        ),
                        new Container(
                          child: new Text('${stud.id}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('School Name'),
                        ),
                        new Container(
                          child: new Text('${stud.schoolName}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Guest ID'),
                        ),
                        new Container(
                          child: new Text('${stud.guestsNo}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Student Name'),
                        ),
                        new Container(
                          child: new Text('${stud.name}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Nrc'),
                        ),
                        new Container(
                          child: new Text('${stud.nrc}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Birthday'),
                        ),
                        new Container(
                          child: new Text('${stud.birthday}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Admission No'),
                        ),
                        new Container(
                          child: new Text('${stud.admissionNo}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Race'),
                        ),
                        new Container(
                          child: new Text('${stud.race}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Religion'),
                        ),
                        new Container(
                          child: new Text('${stud.religion}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Citizen'),
                        ),
                        new Container(
                          child: new Text('${stud.citizens}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('HomeTown'),
                        ),
                        new Container(
                          child: new Text('${stud.homeTown}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Gender'),
                        ),
                        new Container(
                          child: new Text('${stud.gender}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      new Row(children: <Widget>[
                        new Container(
                          child: new Text('Current Address'),
                        ),
                        new Container(
                          child: new Text('${stud.currentAdress}'),
                        )
                      ],),
                      new Divider(height: 1.0,),
                      /*Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          "Class Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Serif",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          child: Text(
                            stud.className,
                            style:
                                TextStyle(fontFamily: "Serif", fontSize: 16.0),
                            overflow: TextOverflow.ellipsis,
                          )),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Text(
                          "Roll_No",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Serif",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 14.0, right: 14.0, bottom: 14.0),
                        child: Text(
                          stud.rollNo,
                          style: TextStyle(fontFamily: "Serif", fontSize: 16.0),
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),*/
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
