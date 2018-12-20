import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/studentAttendance.dart';
import 'package:sms_parent/screens/studentdetail/attendant/attendant_screen.dart';

class AttendantScreen extends StatefulWidget {
  final studentId;
  const AttendantScreen({Key key, this.studentId}) : super(key: key);
  _AttendantScreen createState() => new _AttendantScreen();
}

class _AttendantScreen extends State<AttendantScreen> {
  String mName;
  int _selectValue = 1;
  int datacount = 0;

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
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("attendant_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
      body: new Column(
        children: <Widget>[
          new SizedBox(
            height: 5.0,
          ),
          //new Card(
          //margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          //: 3.0,
          // child:
          new Container(
            width: 370.0,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(color: Colors.white),
            height: 45.0,
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<int>(
                hint: Text('Please Select Month'),
                value: _selectValue,
                items: getItemsList(),
                onChanged: (int val) {
                  setState(() {
                    datacount = 0;
                    _selectValue = val;
                  });
                },
              ),
            ),
          ),
          //),
          new Card(
            child: new Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
              margin: EdgeInsets.all(2.0),
              child: FutureBuilder<List<StudentAttendance>>(
                future: new ApiCommonDao()
                    .viewStudentAttendance(widget.studentId, _selectValue),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new _AttScreen(
                          attList: snapshot.data,
                          month: _selectValue,
                          count: datacount)
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
        ],
      ),
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
  final count;
  _AttScreen({Key key, this.attList, this.month, this.count}) : super(key: key);
  _Attendant createState() => new _Attendant();
}

class _Attendant extends State<_AttScreen> {
  int totaldate = 0;
  int totalcount = 0;
  int totalpresent = 0;
  int percentagecount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StudentAttendance> att = widget.attList;
    int c = 0;
    int datacount = widget.count;
    if (att.length > 0) {
      c = att[0].count;
    }

    totalpresent = widget.count;
    print('totalDate:$totalpresent');

    // print('dataCount:$datacount');
    return new Column(
      children: <Widget>[
        new Card(
          child: new Container(
            height: 38.0,
            child: new ListTile(
              leading: new Container(
                width: 90.0,
                padding: EdgeInsets.only(bottom: 50.0),
                child: (c == 0
                    ? null
                    : new Text(
                        'DATE',
                        style: TextStyle(
                            fontFamily: 'Serif',
                            fontSize: 17.0,
                            color: Colors.black),
                      )),
              ),
              title: new Container(
                padding: EdgeInsets.only(
                  bottom: 50.0,
                ),
                child: new Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: new List.generate(c, (i) {
                  int inde = i + 1;
                  totalcount = inde;
                  if (inde == 1) {
                    return new Text('${inde.toString()}st    ');
                  } else if (inde == 2) {
                    return new Text('${inde.toString()}nd    ');
                  } else if (inde == 3) {
                    return new Text('${inde.toString()}rd    ');
                  } else {
                    return new Text('${inde.toString()}th    ');
                  }
                  /*return DataTitle(
                            title: c[inde].toString(),
                          );*/
                })),
              ),
            ),
          ),
        ),
        new Container(
            child: new Expanded(
          child: ListView.builder(
            itemCount: att.length,
            itemBuilder: (context, index) {
              totaldate = att.length;

              List<String> d = att[index].status.split(',');

              DateTime myDatetime = DateTime.parse(att[index].date);
              String date =
                  "${myDatetime.day}/${myDatetime.month}/${myDatetime.year}";
              //return Container(

              //child:
              return new Card(
                elevation: 5.0,
                margin: EdgeInsets.all(1.0),
                child: new ListTile(
                  leading: new Container(
                    width: 100.0,
                    color: Colors.white,
                    child: new Text(
                      date,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  title: new Container(
                    //width: 150.0,
                    child: Row(
                        children: List.generate(d.length, (index2) {
                      //print('hell$index2');
                      //int first = 0;
                      int second = 0;
                      int total = 0;

                      return DataShow(
                        data: d[index2],
                      );
                      //percentageshow(datacount);
                    })),
                  ),
                ),
                //),
              );
            },
          ),
        )),
      ],
      //),
    );
  }

  void percentageshow(int totalpresent) {
    //setState(() {
    int aa = totaldate * totalcount;
    double bb = totalpresent / aa;
    var aaa = bb.toStringAsFixed(2);
    percentagecount = int.parse(aaa) * 100;
    print('cutttttt:$percentagecount');
    //});
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
            radius: 15.0,
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
              radius: 15.0,
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

class DataTitle extends StatelessWidget {
  final title;
  DataTitle({this.title});
  @override
  Widget build(BuildContext context) {
    if (title == 0) {
      return new CircleAvatar(
        radius: 14.0,
        child: new Text('1st'),
      );
    } else if (title == 1) {
      return new CircleAvatar(
        radius: 14.0,
        child: new Text('2st'),
      );
    }
  }
}
