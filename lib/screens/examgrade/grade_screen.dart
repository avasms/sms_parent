import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sms_parent/models/examGrade.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/app_translation.dart';

class ExamGradeListData extends StatelessWidget {
  final String studentId;

  const ExamGradeListData({Key key, this.studentId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
       backgroundColor: Colors.indigo.shade700,
       title: new Text(AppTranslations.of(context).text("grade_menu"),style: TextStyle(fontFamily: 'Myanmar',color: Colors.white),)
       ),
      body: FutureBuilder<List<ExamGrade>>(
        future: new ApiCommonDao().getExamGradeList(this.studentId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(examList: snapshot.data)
              //snapshot.data.documents.map((document) {}).toList()
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final List<ExamGrade> examList;
  StudentList({Key key, this.examList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: ListView.builder(
          shrinkWrap: true,
          padding: new EdgeInsets.all(8.0),
          itemCount: examList.length,
          itemBuilder: (context, index) {
            final item = examList[index];
            return Card(
               color: Colors.white,
              child: new ExpansionTile(
                title: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("exam_menu"),
                              style: TextStyle(fontFamily: 'Myanmar')
                              ),
                          TextSpan(
                              text: ' : ${item.examName}',
                              style: TextStyle(fontFamily: 'Zawgyi')),
                        ],
                      ),
                    ),
               
                backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  new Column(
                    children: _buildExpandableChild(item),
                  ),
                ]
                ),
            );
           
          }),
    );
  }

  _buildExpandableChild(ExamGrade item) {
    List<Widget> columnContent = [];

    for (Map grade in item.gradeList)
      columnContent.add(
        new ListTile(
          title: new Text(
            grade['subjectName'].toString(),
            style: new TextStyle(fontSize: 18.0,fontFamily: 'Zawgyi'),
          ),
          leading: new Icon(Icons.star_border),
          trailing:  new Text(
            grade['grade']==null?'':grade['grade'].toString(),
            style: new TextStyle(fontSize: 18.0,fontFamily: 'Zawgyi'),
          ),
        ),
      );

    return columnContent;
  }
}
