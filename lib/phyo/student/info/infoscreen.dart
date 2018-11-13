import 'package:flutter/material.dart';
import 'package:newapp/student/data_student.dart';

class InfoScreen extends StatefulWidget {
  final Student student;
  InfoScreen({this.student});
  _Info createState() => new _Info();
}

class _Info extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    Student receiveData = widget.student;
    String title = receiveData.schoolName;
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
                      Container(
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
                            receiveData.className,
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
                          receiveData.admissionNo,
                          style: TextStyle(fontFamily: "Serif", fontSize: 16.0),
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        indent: 35.0,
                      ),
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
