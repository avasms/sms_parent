import 'package:flutter/material.dart';
import 'package:sms_parent/models/timetable.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class WedScreen extends StatefulWidget{
final sectionId;
const WedScreen({Key key, this.sectionId}) : super(key: key);
@override
_WedScreenState createState() => new _WedScreenState();
}

class _WedScreenState extends State<WedScreen>{

@override
Widget build(BuildContext context) {
    return Scaffold(
       body: FutureBuilder<List<TimeTable>>(
        future: new ApiCommonDao().getTimeTableListByClassId(widget.sectionId, 'Wednesday'),
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
         return ListTile(
          title: new Text(item.subjectName+'           '+item.startTime+' - '+item.endTime,
          style: TextStyle(fontFamily:'Zawgyi' ),),
          
         );
         }
      );
    
        
  }
}
