import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sms_parent/models/examGrade.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class ExamGradeListData extends StatelessWidget {
  
  final String studentId;

  const ExamGradeListData({Key key, this.studentId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ExamGrade>>(
        future: new ApiCommonDao().getExamGradeList(this.studentId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(transport: snapshot.data)
              //snapshot.data.documents.map((document) {}).toList()
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final List<ExamGrade> transport;
  StudentList({Key key, this.transport}) : super(key: key);
  //StudentList({Key key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
           
    child: ListView.builder(
       shrinkWrap: true,
      padding: new EdgeInsets.all(8.0),
        itemCount: transport.length,
        itemBuilder: (context, index) {
          final item = transport[index];
          //final item2=item.gradeList[index];
          return ExpansionTile(
              title: Text('Exam Name:${item.examName}'),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                            child: new ListView.builder(
                               itemCount: item.gradeList.length,
                              itemBuilder: (context, index) {
                                  final item2 = item.gradeList[index];
                            
                                    return new ListTile( 
                                      leading: Icon(Icons.person),
                                      title: Text(' Subject          :  Grade       '),
                                      subtitle: new RichText(
                                        text: new TextSpan( 
                                          style: DefaultTextStyle.of(context).style,
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text:
                                                  '${item2['subjectName'].toString()}     : ${item2['grade'].toString()}\n',
                                              style: new TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                 
                              }
                            ),
                          ),
                        ),
                      ),
                    
                         
                ]
                
           
              
              );
       
        }),
    );
  }
}
