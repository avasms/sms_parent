import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Exam extends StatefulWidget {
   _ExamState createState() => _ExamState();
  
}


class _ExamState extends State<Exam> {

  @override
 void initState() {
    super.initState();
    _fetchData();
  } 

  List<ExamStudent> list = List();
  var isLoading = false;

  _fetchData() async {
    isLoading = true;
    setState(() {
      //
    });
    final response =
        await http.get("http://192.168.100.15:8080/AVASMS/api/studentExamSubject/1");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new ExamStudent.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load Exam Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white), 
           onPressed: () => Navigator.of(context).pushNamed('/home'),
           ), 
          title: Text("Student Exam List"),
        ),
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
                 children: <Widget>[
                  new ListTile(
                    leading: Icon(Icons.star),
                    title: new Text(list[index].name+ "               "+list[index].startTime+" - "+list[index].endTime),
                    subtitle: Text(list[index].examDateFrom), 
                  ),
                  new Divider(color: Colors.red,height: 4.0,)
                 ],
               );

 
                }));
  }
}


