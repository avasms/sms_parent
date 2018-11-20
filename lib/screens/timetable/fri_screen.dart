import 'package:flutter/material.dart';
import 'package:sms_parent/models/timetable.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class FriScreen extends StatefulWidget{
final sectionId;
const FriScreen({Key key, this.sectionId}) : super(key: key);
@override
_FriScreenState createState() => new _FriScreenState();
}

class _FriScreenState extends State<FriScreen>{

@override
Widget build(BuildContext context) {
    return Scaffold(
       body: FutureBuilder<List<TimeTable>>(
        future: new ApiCommonDao().getTimeTableListByClassId(widget.sectionId, 'Friday'),
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
         return new Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             new Container(
               padding: EdgeInsets.only(left:5.0,right: 10.0,bottom: 10.0,top: 10.0),
               width: 150.0,
               child: new Text(item.subjectName,style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0),),
             ),
             new Container(
               padding: EdgeInsets.all(10.0),
               child: new Text(item.startTime +'-'+ item.endTime,style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0),),
             ),
           ],
         );
         }
      );    
  }
}
