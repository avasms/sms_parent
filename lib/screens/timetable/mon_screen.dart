import 'package:flutter/material.dart';
import 'package:sms_parent/models/timetable.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class MonScreen extends StatefulWidget{
final sectionId;
const MonScreen({Key key, this.sectionId}) : super(key: key);
@override
_MonScreenState createState() => new _MonScreenState();
}

class _MonScreenState extends State<MonScreen>{

@override
Widget build(BuildContext context) {
    return Scaffold(
       body: FutureBuilder<List<TimeTable>>(
        future: new ApiCommonDao().getTimeTableListByClassId(widget.sectionId, 'Monday'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? TimeTableList(timetable: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class TimeTableList extends StatelessWidget {
  final List<TimeTable> timetable;
TimeTableList({Key key, this.timetable}) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
         itemCount: timetable.length,
         itemBuilder: (context, index) {
         final item=timetable[index];
     //     const ListTile(title: Text('Student List')),
        return ExpansionTile(
              title:  Text('Transport Name:${item.subjectName}'),
             backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              
             children:  <Widget>[
             new Container(height: 15.0,),
             ListTile(
            leading: Icon(Icons.directions_bus,size: 50.0,),
             title: Text('School Name :${item.subjectName} '),
             subtitle: new RichText(    
             text: new TextSpan(
             //text: 'Driver Name: U Maung Maung\n ' ,
             style: DefaultTextStyle.of(context).style,
             children: <TextSpan>[
             new TextSpan(text:'Route Far :${item.subjectName}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
             
            ],
              ),
            ),
          
      
            ),
           
            ]
          );
        
        }
      );
    
        
  }
}
