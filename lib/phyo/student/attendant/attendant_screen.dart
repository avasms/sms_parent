import 'package:flutter/material.dart';
import 'package:newapp/student/data_student.dart';

class AttendantScreen extends StatefulWidget {
  final Student student;
  AttendantScreen({this.student});
  _AttendantScreen createState() => new _AttendantScreen();
}

class _AttendantScreen extends State<AttendantScreen> {
  String _selectValue = '';
  List<Student> student;
  String aa = "";
  String bb = "";
  List<String> val = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();    
    for (int i=0;i<students.length;i++){
      val.add(students[i].name);
      _selectValue=val.first;

    }    
  }

  @override
  Widget build(BuildContext context) {
    Student attStudent=widget.student;
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
              child: new DropdownButton<String>(
                  value: _selectValue,
                  isDense: true,
                  items: val
                      .map((String item) => new DropdownMenuItem<String>(
                          value: item, child: new Text(item)))
                      .toList(),
                  onChanged: (String s) {
                    setState(() {
                      _selectValue = s;
                    });
                  }),
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
