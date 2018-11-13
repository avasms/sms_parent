import 'package:flutter/material.dart';
import 'package:newapp/student/data_student.dart';
import 'package:newapp/student/student_screen.dart';

class Receive extends StatefulWidget {
  ViewPage createState() => new ViewPage();
}

class ViewPage extends State<Receive> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final sendMessage = new Container(
    child: ListView.builder(
        itemCount: students.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position) {
          final item = students[position];
          Student data=students[position];
          double c_width = MediaQuery.of(context).size.width * 0.8;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(height: 5.0),
              ListTile(
                  title: Text(
                    '${item.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Serif',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: new Container(
                    width: c_width,
                    height: 25.0,
                    
                    //padding: EdgeInsets.only(left: 0.0),
                    child: new Chip(
                      backgroundColor: Colors.white24,
                      label: new Text(
                        '${item.schoolName}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Serif',
                        
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25.0,
                        child: new IconButton(
                          icon: new Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=> new StudentScreen(data:data)
                        ));
                  }
                  ),
            ],
          );
        }),
  );


    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Data'),
        ),
        body: sendMessage,
      ),
    );
    //return sendMessage;
  }
}
