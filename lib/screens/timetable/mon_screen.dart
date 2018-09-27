import 'package:flutter/material.dart';
class MonScreen extends StateLessWidget{
final classId;
MonScreen({Key key, this.classId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Column(
                    children:[
                       
                    new ListTile(
                    leading: Icon(Icons.star),
                    title: new Text(list[index].subjectName),
                  ),
                  new Divider(height: 2.0,color: Colors.red,),
                    ]

                  );

 
                }));
  }
}

class TimeTable {
  final int id;
  final String subjectName;

  
  TimeTable({this.id,this.subjectName});

  factory TimeTable.fromJson(Map<String, dynamic> json) {
    return TimeTable(
      id:json['id'] as int,
      subjectName: json['subjectName'] as String,

    );
  }
}