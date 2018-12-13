import 'package:flutter/material.dart';
import 'package:sms_parent/screens/studentdetail/data_student.dart';
import 'package:sms_parent/models/studentAttendance.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class AttendantScreen extends StatefulWidget {
  final studentId;
  const AttendantScreen({
    Key key,
    this.studentId,
  }) : super(key: key);
  Attendant_Screen createState() => new Attendant_Screen();
}

class Attendant_Screen extends State<AttendantScreen> {
  String mName;
  int _selectValue=1;
  static Map<int, String> month_map = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new SizedBox(
            height: 5.0,
          ),
          new Container(
            //padding: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 30.0,right: 30.0),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            height: 45.0,
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<int>(
                hint: Text('Please Select Month'),
                value: _selectValue,
                items: getItemsList(),
                onChanged: (int val) {
                  setState(() {
                    _selectValue = val;
                  });
                },
              ),
            ),
          ),
          new Container(
            width: double.infinity,
            height: 280.0,
            color: Colors.white,
            margin: EdgeInsets.all(2.0),
            child: FutureBuilder<List<StudentAttendance>>(
              future: new ApiCommonDao()
                  .viewStudentAttendance(widget.studentId, _selectValue),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new _AttScreen(
                        attList: snapshot.data, month: _selectValue)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ],
      ),
      //getDataContainer('data'),
    );
  }

  getItemsList() {
    List<DropdownMenuItem<int>> obj = new List<DropdownMenuItem<int>>();
    for (var key in month_map.keys) {
      obj.add(new DropdownMenuItem(
          value: key, child: new Text("${month_map[key]}")));
    }
    return obj;
  }
}

class _AttScreen extends StatefulWidget {
  final attList;
  final month;
  _AttScreen({Key key, this.attList, this.month}) : super(key: key);
  _AttendantScreen createState() => new _AttendantScreen();
}

class _AttendantScreen extends State<_AttScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StudentAttendance> att = widget.attList;
    int c = 0;
    if(att.length>0){
      c = att[0].count;
    }

    //print('gkfjgjfkgfjgfkg:${att.length}');
    
    //print('kdfjdfdjfdjf:${c.toString()}');
    return new Container(
      //height: 500.0,
      color: Colors.white54,
      padding: EdgeInsets.all(5.0),
      child: new Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new ListTile(
              leading:new Container(
                width:100.0,
                child:(c==0?null:new Text('DATE',style: TextStyle(fontSize: 19.0,color: Colors.black),)),) ,
              title: new Container(
                child: new Row(
                    children: new List.generate(c, (i) {
                      int inde=i+1;
                      if (inde==1){
                        return new Text('  ${inde.toString()}st    ');
                      }
                      else if(inde==2){
                      return new Text('${inde.toString()}nd    ');}
                      else if(inde==3){
                      return new Text('${inde.toString()}rd    ');}
                      else{
                        return new Text('${inde.toString()}th    ');
                      }
                  /*return DataTitle(
                            title: c[inde].toString(),
                          );*/
                })),
              ),
            ),
          ),
          new Container(
          child:new Expanded(            
            child: ListView.builder(
              itemCount: att.length,
              itemBuilder: (context, index) {
                List<String> d = att[index].status.split(',');
                return Container(

                  child: new Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(1.0),
                    child: new ListTile(
                      leading: new Container(
                        width: 100.0,
                        color: Colors.white,
                        child: new Text(
                          att[index].date,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      title: new Container(
                        //width: 150.0,
                        child: Row(
                            children: List.generate(d.length, (index2) {
                          print('hell$index2');
                          return DataShow(
                            data: d[index2],
                          );
                        })),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          ),
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
    if (data == 'present') {
      return new Container(
          padding: EdgeInsets.only(
            right: 4.0,
          ),
          child: CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.green,
            child: new Icon(
              Icons.done,
              color: Colors.white,
            ),
          ));
    } else if (data == 'absent') {
      return new Container(
          padding: EdgeInsets.only(
            right: 4.0,
          ),
          child: CircleAvatar(
              radius: 18.0,
              backgroundColor: Colors.red,
              child: new Icon(
                Icons.clear,
                color: Colors.white,
              )));
    } else {
      new Container(
          padding: EdgeInsets.only(right: 4.0),
          child: CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.yellow,
            child: new Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ));
    }
  }
}
class DataTitle extends StatelessWidget{
  final  title;
  DataTitle({this.title});
  @override
  Widget build(BuildContext context){
    if(title==0){
     return new CircleAvatar(
       radius:20.0,
       child: new Text('1st'),
     );
    }else if(title==1){
      return new CircleAvatar(
       radius:20.0,
       child: new Text('2st'),
     );
    }
  }
}

