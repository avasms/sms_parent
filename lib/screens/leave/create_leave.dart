import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sms_parent/dao/authdao.dart';
import 'package:sms_parent/models/admin.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:sms_parent/screens/dormitory/dormitory_screen.dart';
import 'package:sms_parent/util/application.dart';
import 'package:flutter/cupertino.dart';

class CreateLeaveScreen extends StatefulWidget {
  final parentId;
  const CreateLeaveScreen({Key key, this.parentId}) : super(key: key);
  @override
  _LeaveScreenState createState() => new _LeaveScreenState();
}

class _LeaveScreenState extends State<CreateLeaveScreen> {


  TransitionType transitionType = TransitionType.native;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Student>>(
              future: new ApiCommonDao().getStudentList(widget.parentId),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                    
                              return snapshot.hasData
                                  ? StudentList(stu: snapshot.data,admin:_getAdminData())
                                  : Center(child: CircularProgressIndicator());
                            },
                          ),
                        );
                      }
                    }
              
              _getAdminData() async {
  var data =new ApiCommonDao().getAdminManagementList();
    return data;
}
      
 

class StudentList extends StatefulWidget {
  final List<Student> stu;

  final List<AdminStaff> admin;

  StudentList({Key key, this.stu,this.admin}) : super(key: key);

  @override
  StudentListState createState() {
    return new StudentListState();
  }
}

class StudentListState extends State<StudentList> {
    String _leaveType, _leaveDes, _fromDate, _toDate, _student,_admin;
  String _mySelection,_adminSelection;

  String _datetime = '';

  int year = 2018;

  int month = 10;

  int date = 3;
  String _datetime2 = '';

  int year1 = 2018;

  int month1 = 10;

  int date1 = 3;

  final _formKey = GlobalKey<FormState>();

  //Future<List<AdminStaff>> _getAdminData() async {
 //   Future<List<AdminStaff>> data =new ApiCommonDao().getAdminManagementList();
    
 //   return data;
  //}
  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 170.0,
          height: 50.0,
          onPressed: () {
            //_login();
          },
          color: Colors.blueAccent,
          child: Text('Save Data', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    
        final leaveType = TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
           onSaved: (value) => _leaveType= value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Leave Type';
        }
      },
      decoration: InputDecoration(
        labelText: 'Leave Type',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        filled: true,
        fillColor: Colors.white,
      ),
    );
    final leaveDes = TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      autofocus: false,
       onSaved: (value) => _leaveDes= value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Leave Description';
        }
      },

      decoration: InputDecoration(
        labelText: 'Leave Description ',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        filled: false,
        fillColor: Colors.white,
      ),
    );

    final _student = DropdownButton<String>(
      style: Theme.of(context).textTheme.title,
      isDense: true,
      hint: new Text("Please Choose  Student "),
      value: _mySelection,
      onChanged: (String newValue) {},
      items: widget.stu.map((Student value) {
        return new DropdownMenuItem<String>(
          value: value.id.toString(),
          child: new SizedBox(
              width: 90.0, child: new Text(value.name.toString())),
        );
      }).toList(),
    );
    final admin=DropdownButton<String>(
     style: Theme.of(context).textTheme.title,
      isDense: true,
      hint: new Text("Please Choose  Admin "),
      value: _adminSelection,
      onChanged: (String newValue) {},
      items: widget.stu.map((Student value) {
        return new DropdownMenuItem<String>(
          value: value.id.toString(),
          child: new SizedBox(
              width: 90.0, child: new Text(value.name.toString())),
        );
      }).toList(),
    );
    final leaveForm = new ClipRect(
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new SizedBox(
                        width: 320.0,
                        height: 40.0,
                        child: new RaisedButton(
                            child: new Text(
                              'Select From Date $_datetime',
                            ),
                            onPressed: () {
                              final bool showTitleActions = false;
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minYear: 2018,
                                maxYear: 2020,
                                initialYear: year,
                                initialMonth: month,
                                initialDate: date,
                                locale: 'en',
                                dateFormat: 'yyyy-mmm-dd',
                                onChanged: (year, month, date) {
                                  print('onChanged date: $year-$month-$date');

                                  if (!showTitleActions) {
                                    settingDatetime(year, month, date);
                                  }
                                },
                                onConfirm: (year, month, date) {
                                  settingDatetime(year, month, date);
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        '',
                        style: Theme.of(context).textTheme.title,
                      ),
                      new SizedBox(
                        width: 320.0,
                        height: 40.0,
                        child: new RaisedButton(
                            child: new Text(
                              'Select To Date $_datetime2',
                            ),
                           
                            onPressed: () {
                              final bool showTitleActions = true;
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: showTitleActions,
                                minYear: 2018,
                                maxYear: 2020,
                                initialYear: year,
                                initialMonth: month,
                                initialDate: date,
                                locale: 'en',
                                dateFormat: 'yyyy-mmm-dd',
                                onChanged: (year1, month1, date1) {
                                  print(
                                      'onChanged date: $year1-$month1-$date1');

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
                ),
                    new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                         new Text(
                        '',
                        style: Theme.of(context).textTheme.title,
                      ),
                new SizedBox(
                  width: 320.0,
                  height: 40.0,
                  child: DropdownButton<String>(
                    style: Theme.of(context).textTheme.title,
                    isDense: true,
                    hint: new Text("Please Choose  Student "),
                    value: _mySelection,
                    onChanged: (String newValue) {},
                    items: widget.stu.map((Student value) {
                      return new DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: new SizedBox(
                            width: 95.0,
                            child: new Text(value.name.toString())),
                      );
                    }).toList(),
                  ),
                ),
                    ]
                    )
                    ),
                SizedBox(
                  height: 26.0,
                ),
                admin,
                SizedBox(
                  height: 25.0,
                ),
              //  leaveType,
                SizedBox(
                  height: 25.0,
                ),
                leaveDes,
                SizedBox(height: 20.0),
                loginButton,
              ],
            ),
          ),
        ),
      ),
    );
    return new Scaffold(
      appBar: null,
      body: new Container(
        decoration: new BoxDecoration(
          color: Colors.indigo.shade700,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 3.0, right: 1.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            leaveForm,
          ],
        ),
      ),
    );
  }

  void settingDatetime(int year, int month, int date) {
    setState(() {
      this.year = year;
      this.month = month;
      this.date = date;
      _datetime = '$year-$month-$date';
    });
  }

  void settingDatetime2(int year1, int month1, int date1) {
    setState(() {
      this.year1 = year1;
      this.month1 = month1;
      this.date1 = date1;
      _datetime2 = '$year1-$month1-$date1';
    });
  }
}
