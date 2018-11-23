import 'package:flutter/material.dart';
import 'package:sms_parent/screens/studentdetail/data_student.dart';
import 'package:sms_parent/models/studentAttendance.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class AttendantScreen extends StatefulWidget {
  final studentId;
  const AttendantScreen({Key key,this.studentId,}) : super(key:key);
  Attendant_Screen createState() => new Attendant_Screen();

}
class Attendant_Screen extends State<AttendantScreen>{
List<String> monthName=[];
String mName;
String _selectValue;
static Map<int, String> month_map = {
    1:"January",
    2:"February",
    3:"March",
    4:"April",
    5:"May",
    6:"June",
    7:"July",
    8:"August",
    9:"September",
    10:"October",
    11:"November",
    12:"December" };

   
    
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
     
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.cyan,
            width: 350.0,
            height: 40.0,
            /*child: new DropdownButtonHideUnderline(
              child: new DropdownButton<Map<int,String>>(
                  value: _selectValue,
                  items: month_map.map((Map<int,String> aa){
                    return new DropdownMenuItem(
                      value: aa.value,
                      child: new Text("${value}")
                    );
                  }).toList(),
                  onChanged: (String value){
                    _selectValue=value;
                  }
                ),
            ),*/
          ),
    );
    /*return Scaffold(
      body: FutureBuilder<List<StudentAttendance>>(
        future: new ApiCommonDao().viewStudentAttendance(widget.studentId, month) ,
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
          ? new _AttScreen(attList:snapshot.data,month:month)
          : Center(child: CircularProgressIndicator(),);
        },
      ),
    );*/
  }
}

class _AttScreen extends StatefulWidget{
  List<StudentAttendance> attList;
  final month;
 _AttScreen({Key key,this.attList,this.month}) : super(key:key);
  _AttendantScreen createState()=> new _AttendantScreen();
}

class _AttendantScreen extends State<_AttScreen>{
  List<StudentAttendance> attendant;
  StudentAttendance _selectValue = new StudentAttendance();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();   
    _selectValue= widget.attList.first;
    
  }

  @override
  Widget build(BuildContext context) {
    //Student studId=widget.studentId;
    return new Container(
      padding: EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.cyan,
            width: 350.0,
            height: 40.0,
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<StudentAttendance>(
                      hint: Text('Please Select date'),
                      value: _selectValue,
                      items: attendant.map((StudentAttendance att) {
                        return new DropdownMenuItem<StudentAttendance>(
                          value: att,
                          child: new Text(att.date),
                        );
                      }).toList(),
                      onChanged: (StudentAttendance adminStaff) {
                        setState(() {
                          _selectValue = adminStaff;
                          //return new Scaffold();
                          
                        });
                      },
                    ),
            ),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Container(
                  child: new Card(
                    child: new ListTile(
                      leading: new Chip(
                        backgroundColor: Colors.white,
                        label: new Text(
                          'Data',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: new Container(
                        width: 150.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(students.length, (index) {
                              return DataShow(
                                data: students[index].rollNo,
                              );
                            })),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DataShow extends StatelessWidget {
  //IconData data;
  //DataShow({this.data});
  String data;
  DataShow({this.data});

  @override
  Widget build(BuildContext context) {
    return new CircleAvatar(
      radius: 18.0,
      child: new Text('$data'),
    );
  }
}
