import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:sms_parent/models/admin.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class CreateLeaveScreen extends StatefulWidget {
  final userId, studentId, studentName;
  const CreateLeaveScreen(
      {Key key, this.userId, this.studentId, this.studentName})
      : super(key: key);
  @override
  _LeaveScreenState createState() => new _LeaveScreenState();
}

class _LeaveScreenState extends State<CreateLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AdminStaff>>(
      future: new ApiCommonDao().getAdminManagementList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? LeaveForm(
                adList: snapshot.data,
                studentId: widget.studentId,
                studentName: widget.studentName,
                userId: widget.userId)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class LeaveForm extends StatefulWidget {
  final List<AdminStaff> adList;
  final userId, studentId, studentName;
  LeaveForm(
      {Key key, this.adList, this.studentId, this.studentName, this.userId})
      : super(key: key);

  @override
  LeaveFormState createState() {
    return new LeaveFormState();
  }
}

class LeaveFormState extends State<LeaveForm> {
  AdminStaff _selectAdmin = new AdminStaff();

  var _formkey = new GlobalKey<FormState>();
  TextEditingController _clear1 = new TextEditingController();
  TextEditingController _clear2 = new TextEditingController();
  String _title, _description;

  String _fromdatetime = '';
  String _todatetime = '';
  var nowDate = new DateTime.now();
  int fromyear = 2018;

  int frommonth = 10;

  int fromdate = 3;

  int toyear = 2018;

  int tomonth = 10;

  int todate = 3;

  String _userId; 
  List<AdminStaff> dataList;
  String _stuId;
  void initState() {
    super.initState();
    dataList = widget.adList;
    _userId = widget.userId;
    _selectAdmin = widget.adList.first;
    _stuId = widget.studentId;
    print(nowDate);
  }

  @override
  Widget build(BuildContext context) {
    final receiver = new Container(
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(
              width: 1.0, color: Colors.grey, style: BorderStyle.solid)),
      width: 320.0,
      height: 50.0,
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<AdminStaff>(
          value: _selectAdmin,
          items: dataList.map((AdminStaff adminStaff) {
            return new DropdownMenuItem<AdminStaff>(
              value: adminStaff,
              child: new Text(adminStaff.name),
            );
          }).toList(),
          onChanged: (AdminStaff adminStaff) {
            setState(() {
              _selectAdmin = adminStaff;
            });
          },
        ),
      ),
    );
    final sender = new Container(
        padding: EdgeInsets.only(top: 14.0, bottom: 5.0, left: 5.0, right: 5.0),
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
                width: 1.0, color: Colors.grey, style: BorderStyle.solid)),
        //color: Colors.grey,
        width: 320.0,
        height: 50.0,
        child: new Text(
          widget.studentName,
        ));

    final dateForm = new Container(
      //padding: EdgeInsets.only(left: 15.0),
      child: Row(
        children: <Widget>[
          new Container(
            width: 162.0,
            height: 60.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.grey),
                shape: BoxShape.rectangle),
            child: new FlatButton(
                child: new Text(
                  'From Date\n$_fromdatetime',
                ),
                onPressed: () {
                  final bool showTitleActions = true;
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: showTitleActions,
                    minYear: 2018,
                    maxYear: 2020,
                    initialYear: fromyear,
                    initialMonth: frommonth,
                    initialDate: fromdate,
                    locale: 'en',
                    dateFormat: 'yyyy-mmm-dd',
                    onChanged: (year1, month1, date1) {
                      print('onChanged date: $year1-$month1-$date1');

                      if (!showTitleActions) {
                        settingDatetime1(year1, month1, date1);
                      }
                    },
                    onConfirm: (year1, month1, date1) {
                      settingDatetime1(year1, month1, date1);
                    },
                  );
                }),
          ),
          new SizedBox(
            width: 10.0,
            height: 0.0,
          ),
          new Container(
            width: 162.0,
            height: 60.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.grey),
                shape: BoxShape.rectangle),
            child: new FlatButton(
                child: new Text(
                  'To Date\n$_todatetime',
                ),
                onPressed: () {
                  final bool showTitleActions = true;
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: showTitleActions,
                    minYear: 2018,
                    maxYear: 2020,
                    initialYear: toyear,
                    initialMonth: tomonth,
                    initialDate: todate,
                    locale: 'en',
                    dateFormat: 'yyyy-mmm-dd',
                    onChanged: (year1, month1, date1) {
                      print('onChanged date: $year1-$month1-$date1');

                      if (!showTitleActions) {
                        settingDatetime2(year1, month1, date1);
                      }
                    },
                    onConfirm: (year1, month1, date1) {
                      settingDatetime2(year1, month1, date1);
                    },
                  );
                }),
          ),
        ],
      ),
    );

    final title = new Container(
      width: 325.0,
      height: 40.0,
      child: new TextFormField(
        autofocus: false,
        controller: _clear1,
        onSaved: (value) => _title = value,
        validator: (value) {
          if (value.isEmpty) return 'Please Enter Title';
        },
        decoration: InputDecoration(
          labelText: 'Title',
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          labelStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 18.0),
          contentPadding: EdgeInsets.all(15.0),
        ),
      ),
    );

    final description = new Container(
      width: 325.0,
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.multiline,
        maxLines: 8,
        textInputAction: TextInputAction.newline,
        onSaved: (value) => _description = value,
        controller: _clear2,
        validator: (value) {
          if (value.isEmpty) return 'Please Enter Description';
        },
        decoration: InputDecoration(
          labelText: 'Description',
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          labelStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 18.0),
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );

    return new Center(
      child: new Container(
        child: new Card(
          color: Colors.white70,
          child: new Form(
            key: _formkey,
            child: new ListView(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: new Text(
                    "To",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(8.0), child: receiver),
                new Padding(padding: EdgeInsets.all(8.0), child: sender),
                new Padding(padding: EdgeInsets.all(8.0), child: dateForm),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: title,
                ),
                new SizedBox(
                  height: 30.0,
                  width: 0.0,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: description,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 48.0,
                    width: 300.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      onPressed: () {
                        if (_fromdatetime == '' || _fromdatetime == '') {
                          if (_fromdatetime == '') {
                            Fluttertoast.showToast(
                                msg: "Plese insert From Date",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIos: 20,
                                bgcolor: '#ffffff',
                                textcolor: '#d50000');
                          } else {
                            Fluttertoast.showToast(
                                msg: "Plese insert To Date",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIos: 20,
                                bgcolor: '#ffffff',
                                textcolor: '#d50000');
                          }
                        } else {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                            new ApiCommonDao().sendLeaveFormToSchool(_userId, _selectAdmin.id.toString(), _stuId,
      _fromdatetime,_todatetime,_title,_description);
                          }
                        }
                      },
                      color: Colors.blueAccent,
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void settingDatetime1(int fromyear, int frommonth, int fromdate) {
    setState(() {
      this.fromyear = fromyear;
      this.frommonth = frommonth;
      this.fromdate = fromdate;
      _fromdatetime = '$fromyear-$frommonth-$fromdate';
    });
  }

  void settingDatetime2(int toyear, int tomonth, int todate) {
    setState(() {
      this.toyear = fromyear;
      this.tomonth = tomonth;
      this.fromdate = fromdate;
      _todatetime = '$toyear-$tomonth-$todate';
    });
  }
}
