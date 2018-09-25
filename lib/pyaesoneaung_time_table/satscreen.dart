import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class SatPage extends StatefulWidget{
@override
  _SatPageState createState() => new _SatPageState();
}

class _SatPageState extends State<SatPage>{
    @override
 void initState() {
    super.initState();
    _fetchData();
  } 

  List<TimeTable> list = List();
  var isLoading = false;

  _fetchData() async {
    isLoading = true;
    setState(() {
      //
    });
    final response =
        await http.get("http://192.168.100.4:8080/AVASMS/api/studentTimeTable/9/Satursday");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new TimeTable.fromJson(data))
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