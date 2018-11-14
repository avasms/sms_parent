import 'dart:async';
//import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
//import 'package:sms_parent/models/admin.dart';
//import 'package:sms_parent/models/student.dart';
//import 'package:sms_parent/dao/apicommondao.dart';

class CreateLeaveScreen extends StatefulWidget {
  final parentId;
  const CreateLeaveScreen({Key key, this.parentId}) : super(key: key);
  @override
  _LeaveScreenState createState() => new _LeaveScreenState();
}

class _LeaveScreenState extends State<CreateLeaveScreen> {
  List<String> student =
      ["Choose sender name", "Mg", "Aye", "Su", "Hla", "Sapel"].toList();
  List<String> staff = [
    "Choose receiver name",
    "U Mg Hla",
    "Daw Aye Nyein",
    "Daw Su Hlaing",
    "Daw Hla",
    " Daw Sapel"
  ].toList();
  String _selectStudent = "";
  String _selectStaff = "";
  var _formkey = new GlobalKey<FormState>();
  TextEditingController _clear1 = new TextEditingController();
  TextEditingController _clear2 = new TextEditingController();
  String _title, _description;

  String _fromdatetime = '';
  String _todatetime = '';

  int fromyear = 2018;

  int frommonth = 10;

  int fromdate = 3;

  int toyear = 2018;

  int tomonth = 10;

  int todate = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_selectStaff=staff.first;
    _selectStaff = staff.first;
    _selectStudent = student.first;
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
      padding: EdgeInsets.all(5.0),
      //padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0,right: 5.0),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
            value: _selectStaff.trim(),
            isDense: true,
            items: staff
                .map((String item) => new DropdownMenuItem<String>(
                    value: item, child: new Text(item)))
                .toList(),
            onChanged: (String s) {
              setState(() {
                _selectStaff = s;
              });
            }),
      ),
    );
    final sender = new Container(
      //padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0,right: 5.0),
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
              width: 1.0, color: Colors.grey, style: BorderStyle.solid)),
      //color: Colors.grey,
      width: 320.0,
      height: 50.0,
      padding: EdgeInsets.all(5.0),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
            value: _selectStudent.trim(),
            isDense: true,
            items: student
                .map((String item) => new DropdownMenuItem<String>(
                    value: item, child: new Text(item)))
                .toList(),
            onChanged: (String s) {
              setState(() {
                _selectStudent = s;
              });
            }),
      ),
    );
    final dateForm = new Container(
      //padding: EdgeInsets.only(left: 15.0),
      child: Row(
        children: <Widget>[
          new Container(
            width: 162.0,
            height: 40.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.grey),
                shape: BoxShape.rectangle),
            child: new FlatButton(
                child: new Text(
                  'From Date\n $_fromdatetime',
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
            height: 40.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.grey),
                shape: BoxShape.rectangle),
            child: new FlatButton(
                child: new Text(
                  'To Date\n $_todatetime',
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

    void sendMessage() {
      if (_formkey.currentState.validate()) {
        _formkey.currentState.save();
        _clear1.clear();
        _clear2.clear();
        print(
            '$_title\n$_description\n$_selectStaff\n$_selectStudent\n$_fromdatetime\n$_todatetime');
      }
    }

    return new Center(
      child: new Container(
        child: new Card(
          color: Colors.white70,
          child: new Form(
            key: _formkey,
            child: new ListView(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(8.0), child: receiver),
                new Padding(padding: EdgeInsets.all(8.0), child: sender),
                new Padding(padding: EdgeInsets.all(8.0), child: dateForm),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: title,
                ),
                new SizedBox(
                  height: 15.0,
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
                        sendMessage();
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
