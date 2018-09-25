
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  
  _MyHomePageState createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage> {

  @override
 void initState() {
    super.initState();
    _fetchData();
  } 

  List<Exams> list = List();
  var isLoading = false;

  _fetchData() async {
    isLoading = true;
    setState(() {
      //
    });
    final response =
        await http.get("http://192.168.100.15:8080/AVASMS/api/listStudentExam/9");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Exams.fromJson(data))
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
          title: Text("View Exam"),
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
                    title: new Text(list[index].name),
                onTap: (){
                    Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/exam');
                  }

                  ),
                  new Divider(color: Colors.red,height: 4.0,)
                    ],
                  );
                  
 
                }));
  }
}

class Exams {
  final int id;
  final String name;
  
  Exams({this.id,this.name});

  factory Exams.fromJson(Map<String, dynamic> json) {
    return Exams(
      id:json['id'] as int,
      name: json['name'] as String,
     
    );
  }
}