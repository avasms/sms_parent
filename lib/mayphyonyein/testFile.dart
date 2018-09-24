import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future<List<ExamGrade>> fetchPhotos(http.Client client) async {
  final response = await client.get(
      'http://192.168.100.12:8080/AVASMS/api/student_mark_data_list/sid=50056');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<ExamGrade> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ExamGrade>((json) => ExamGrade.fromJson(json)).toList();
}

class ExamGrade {
  int studentId;
  int examId;
  int id;
  String studentName;
  String year;
  String subjectName;
  String examName;
  String schoolName;
  String grade;
  String className;
  //final List<ExamGrade> gradeList;
  //List<ExamGrade> gradeList = new List<ExamGrade>();
  List gradeList = ["subjectName", "grade"];

  ExamGrade({
    this.id,
    this.studentId,
    this.examId,
    this.studentName,
    this.examName,
    this.grade,
    this.schoolName,
    this.subjectName,
    this.year,
    this.className,
    this.gradeList,
  });
  Map<String, dynamic> toMap() => {
        'id': this.id,
        'studentId': this.studentId,
        'examId': this.examId,
        'studentName': this.studentName,
        'examName': this.examName,
        'grade': this.grade,
        'schoolName': this.schoolName,
        'subjectName': this.subjectName,
        'year': this.year,
        'gradeList': this.gradeList,
        'className': this.className,
      };
  factory ExamGrade.fromJson(Map<String, dynamic> json) {
    return ExamGrade(
      id: json['id'] as int,
      studentId: json['studentId'] as int,
      examId: json['examId'] as int,
      studentName: json['studentName'],
      schoolName: json['schoolName'],
      examName: json['examName'],
      subjectName: json['subjectName'],
      grade: json['grade'],
      year: json['year'],
      className: json['className'],
      // images: Image.fromJson(parsedJson['images'])
      gradeList: json['gradeList'],
      // gradeList:(json['gradeList']).map((i) => ExamGrade.fromJson(i)).toList()
    );
  }
}

class DomortoryListData extends StatelessWidget {
  static const String routeName = '/material/two-level-list';
  final List<ExamGrade> stu;

  const DomortoryListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ExamGrade>>(
        future: fetchPhotos(http.Client()),
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
