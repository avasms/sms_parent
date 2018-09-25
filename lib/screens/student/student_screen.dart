import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class StudentListData extends StatelessWidget {
  static const String routeName = '/material/two-level-list';
 final List<Student> stu;
  
  const StudentListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student List ')),
       body: FutureBuilder<List<Student>>(
        future: new ApiCommonDao().getStudentList('1'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(student: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
    
  }
}
class StudentList extends StatelessWidget {
  final List<Student> student;
StudentList({Key key, this.student}) : super(key: key);
  //StudentList({Key key, this.student}) : super(key: key);

             //String url="http://192.168.100.7:8080/AVASMS/api/transport_data_list/${item.photoPath}";
  @override
  Widget build(BuildContext context) { 
    return new ListView.builder
      (    
        itemCount: student.length,
        itemBuilder: (BuildContext ctxt, int index)
         
         {
          
  String testUrl="http://demo.avasms.net/Images/Student/316407280153424_student.png"; 
 
            final item=student[index];
            
            return new SafeArea(
              top: false,
              bottom: false,
             child: Container(
               padding: const EdgeInsets.all(5.0),
                 child: Card(
                   color: Colors.white,
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               ListTile(
               leading: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Image(image: new NetworkImage(testUrl)),
               maxRadius: 50.0,
               ),
               title: Text('Student Name ',maxLines: 1, style: new TextStyle(color: Colors.blue[700],fontSize: 18.0,wordSpacing:2.0),),
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

             new TextSpan(text:'${item.name}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),
             ),
                new TextSpan(text:'Class Name  \n',
             style: new TextStyle(color: Colors.blue[700],fontSize: 18.0,wordSpacing:2.0),
             ),
             new TextSpan(text:'${item.className}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),
             ),
            // new TextSpan(text: 'Year     -${item.runningYear}\n',
           //  style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),),
             //new TextSpan(text: 'School    -${item.schoolName}\n',
            // style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),),
            ],
                ),
            ),
          
          
                ),
              ]
          ),
                 ),
             ),
             );
        }
    
);
        
  }
}