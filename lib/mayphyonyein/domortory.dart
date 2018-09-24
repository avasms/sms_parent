import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'detailPage.dart';
Future<List<Domortory>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('http://192.168.100.12:8080/AVASMS/api/transport_data_list');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Domortory> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Domortory>((json) => Domortory.fromJson(json)).toList();
}

class Domortory{
  int id;
  String name;
  int roomNo;
  String description;
  String schoolName;
  String teacherName;
  Domortory({
    this.id,
    this.name,
    this.roomNo,
    this.description,
    this.schoolName,
    this.teacherName,

 });


 factory Domortory.fromJson(Map<String, dynamic> json) {
    return Domortory(
      id: json['id'] as int,
      name: json['name'] as String,
      roomNo: json['roomNo'] as int,
      description: json['description'] as String,
      schoolName: json['schoolName'] as String,
      teacherName: json['teacherName'] as String,
    );
  }
}


class DomortoryListData extends StatelessWidget {
  static const String routeName = '/material/two-level-list';
 final List<Domortory> stu;

  const DomortoryListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Domority List ')),
       body: FutureBuilder<List<Domortory>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(transport: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
    
  }
}
class StudentList extends StatelessWidget {
  final List<Domortory> transport;
StudentList({Key key, this.transport}) : super(key: key);
  //StudentList({Key key, this.student}) : super(key: key);
  
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
         itemCount: transport.length,
         itemBuilder: (context, index) {
         final item=transport[index];
     //     const ListTile(title: Text('Student List')),
        return   ExpansionTile(
              title:  Text('Transport Name:${item.name}'),
             backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              
             children:  <Widget>[
             new Container(height: 15.0,),
             ListTile(
            leading: Icon(Icons.person),
             title: Text('School Name :${item.schoolName} '),
              onTap: () {
                 Navigator.push(
                  context,
               MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
              },
             subtitle: new RichText(    
             text: new TextSpan(
             //text: 'Driver Name: U Maung Maung\n ' ,
             style: DefaultTextStyle.of(context).style,
             children: <TextSpan>[
             new TextSpan(text:'Description :${item.description}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
              new TextSpan(text:'Room No.:${item.roomNo}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
             new TextSpan(text: 'Teacher Name :${item.teacherName}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),),
           
            ],
              ),
            ),
          
      
            ),
             //  ListTile(title: Text('Two')),
              // ListTile(title: Text('Free')),
             //  ListTile(title: Text('Four'))
            ]
          );
          // const ListTile(title: Text('Bottom'))
    
        }
      );
    
        
  }
}