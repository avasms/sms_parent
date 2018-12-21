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

class DataCount {
  int count;
  DataCount({this.count});
}

final List<DataCount> dc = [];

class _AttendantScreen extends State<AttendantScreen> {
  String mName;
  int _selectValue;
  int datacount = 0;
  int result = 0;

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
    12: "December",
  
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("attendant_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
      body:new Container(
        height: MediaQuery.of(context).size.height,
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 5.0,
          ),
          //new Card(
          //margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          //: 3.0,
          // child:
          new Container(
            width: 350.0,
            padding: EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.blue),
                shape: BoxShape.rectangle),
            height: 45.0,
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<int>(
                style: Theme.of(context).textTheme.subhead,
                hint: Text('Please Select Month'),
                value: _selectValue,
                items: getItemsList(),
                onChanged: (int val) {
                  setState(() {
                    _selectValue = val;
                    //datacount=dCount.count;
                    //datachange(dc);
                  });
                },
              ),
            ),
          ),
          //),
          new Card(
            child: new Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.75,
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
                          count: datacount,
                          result: result)
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
        ],
      ),
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

  void datachange(List<DataCount> dc) {
    if (dc.length == 0) {
      //dc.add(new DataCount(count: 0));
      result = 0;
    } else {
      result = dc[0].count;
    }
    print('Result:$result');
    print('datalenght:${dc.length}');
  }
}

class _AttScreen extends StatefulWidget {
  final attList;
  final month;
  final count;
  final result;
  _AttScreen({Key key, this.attList, this.month, this.count, this.result})
      : super(key: key);
  _Attendant createState() => new _Attendant();
}

class _Attendant extends State<_AttScreen> {
  int totalDate = 0;
  int totalDataCount = 0;
  int totalPresent = 0;
  int percentageCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StudentAttendance> att = widget.attList;

    int count = 0;
    int cc = 0;
    int datacount = 0;
    if (att.length > 0) {
      datacount = att[0].count;
    }
    totalDataCount = datacount;
    setState(() {
      for (int i = 0; i < att.length; i++) {
        List<String> str = att[i].status.split(',');
        for (int j = 0; j < str.length; j++) {
          if (str[j] == 'present') {
            count += 1;
          }
        }
        cc = count;
        totalDate = att.length;
      }
      totalPresent = cc;
      double bb;
      int aa = totalDate * totalDataCount;
      if (aa == 0 || totalPresent == 0) {
        bb = 0;
      } else {
        bb = totalPresent / aa;
      }

      //var aaa = bb.toStringAsFixed(2);
      double aaa = bb * 100;
      percentageCount = aaa.round();
    });
    print('count:$cc');

    print('totalPresent:$totalPresent');
    print('totalDate:$totalDate');
    print('totalDataCount:$totalDataCount');
    print('totalDataCount:$percentageCount');

    //int datacount = 0;
    int c = 0;
    if (att.length > 0) {
      c = att[0].count;
    }
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Card(
          child: new Container(
            height: 38.0,
            child: new ListTile(
              leading: new Container(
                width: 100.0,
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
                  //totalDataCount = inde;
                  if (inde == 1) {
                    return new Text('${inde.toString()}st    ');
                  } else if (inde == 2) {
                    return new Text('${inde.toString()}nd    ');
                  } else if (inde == 3) {
                    return new Text('${inde.toString()}rd    ');
                  } else {
                    return new Text('${inde.toString()}th    ');
                  }
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
              //totalDate = att.length;

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
                      /*if (index2 == 0 || index2 == 1) {
                        if (d[index2] == 'present') {
                          datacount += 1;
                          print('total:$datacount');
                        }
                      }
                      print('totalAAA:$datacount');
                      //setState(() {
                      totalPresent = datacount;
                      //});*/
                      return DataShow(data: d[index2], count: totalPresent);
                    })),
                  ),
                ),
                //),
              );
            },
          ),
        )),
        new Container(
          width: 350.0,
          height: 50.0,
          decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.blue),
                shape: BoxShape.rectangle),
          child: new ListTile(
            leading: new Text(
              AppTranslations.of(context).text("percentage_of_attendance"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.black,fontSize: 17.0),
            ),
            //title:new Text(AppTranslations.of(context).text('percentage_of_attendance'),
            //style: TextStyle(fontFamily: 'Myanmar',color: Colors.black),
            //),
            //trailing: new Text('${widget.result}%'),
            trailing: new Text(
              '${percentageCount.toString()}%',
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
          ),
        ),
      ],
      //),
    );
  }

  /*void percentageshow(int totalpresent) {
    //setState(() {
    int aa = totalDate * totalDataCount;
    double bb = totalpresent / aa;
    var aaa = bb.toStringAsFixed(2);
    percentageCount = int.parse(aaa) * 100;
    print('cutttttt:$percentageCount');
    //});
  }*/
}

class DataShow extends StatelessWidget {
  //IconData data;
  //DataShow({this.data});
  String data;
  int count;
  DataShow({this.data, this.count});

  @override
  Widget build(BuildContext context) {
    if (data == 'present') {
      /*dc.clear();
      dc.add(new DataCount(count: count));
      print('setstateCountLength:${dc.length} and ${dc[0].count}');*/
      return new Container(
          padding: EdgeInsets.only(
            right: 5.0,
          ),
          child: CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.green,
            child: new Icon(
              Icons.done,
              color: Colors.white,
            ),
          ));
    } else if (data == 'absent') {
      return new Container(
          padding: EdgeInsets.only(
            right: 5.0,
          ),
          child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.red,
              child: new Icon(
                Icons.clear,
                color: Colors.white,
              )));
    } else {
      new Container(
          padding: EdgeInsets.only(right: 5.0),
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
