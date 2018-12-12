import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms_parent/models/admin.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class Send extends StatefulWidget {
  final userId;

  const Send({Key key, this.userId}) : super(key: key);

  ViewPage createState() => new ViewPage();
}

class ViewPage extends State<Send> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AdminStaff>>(
      future: new ApiCommonDao().getAdminManagementList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? MessageForm(adList: snapshot.data, userId: widget.userId)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MessageForm extends StatefulWidget {
  final List<AdminStaff> adList;
  final userId;
  MessageForm({Key key, this.adList, this.userId}) : super(key: key);

  @override
  MessageFormState createState() {
    return new MessageFormState();
  }
}

class MessageFormState extends State<MessageForm> {
  TextEditingController _clear1 = new TextEditingController();
  TextEditingController _clear2 = new TextEditingController();

  var _formKey = new GlobalKey<FormState>();

  String _title, _description;

  AdminStaff _selectValue = new AdminStaff();
  List<AdminStaff> dataList;
  String userId;
  void initState() {
    super.initState();
    userId = widget.userId.toString();
    dataList = widget.adList;
    _selectValue = widget.adList.first;
  }

  @override
  Widget build(BuildContext context) {
    final _titleForm = new TextFormField(
      autofocus: false,
      controller: _clear1,
      onSaved: (value) => _title = value,
      validator: (value) {
        if (value.isEmpty) return 'Please Enter Title';
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Subject',
        labelStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0),
        contentPadding: EdgeInsets.all(15.0),
      ),
    );

    final _descriptionForm = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLines: 7,
      onSaved: (value) => _description = value,
      controller: _clear2,
      validator: (value) {
        if (value.isEmpty) return 'Please Enter Description';
      },
      decoration: InputDecoration(
        hintText: 'Message',
        isDense: true,
        labelStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0),
        contentPadding: EdgeInsets.all(15.0),
      ),
    );

    return new Center(
      child: new Card(
        color: Colors.white,
        child: new Form(
          key: _formKey,
          child: new ListView(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new ListTile(
                  leading: new Text(
                    'To',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: new DropdownButtonHideUnderline(
                    child: new DropdownButton<AdminStaff>(
                      hint: Text('Please Select Admin'),
                      value: _selectValue,
                      items: dataList.map((AdminStaff adminStaff) {
                        return new DropdownMenuItem<AdminStaff>(
                          value: adminStaff,
                          child: new Text(adminStaff.name),
                        );
                      }).toList(),
                      onChanged: (AdminStaff adminStaff) {
                        setState(() {
                          _selectValue = adminStaff;
                          print(
                              "Selected: ${adminStaff.name} (${adminStaff.id})");
                        });
                      },
                    ),
                  ),
                ),
              ),
              new Divider(
                height: 1.0,
              ),
              new Padding(
                padding: EdgeInsets.all(8.0),
                child: _titleForm,
              ),
              new Divider(
                height: 1.0,
              ),
              new Padding(
                padding: EdgeInsets.all(8.0),
                child: _descriptionForm,
              ),
              new Divider(
                height: 1.0,
              ),
              new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.blueAccent.shade100,
                      elevation: 5.0,
                      child: new Container(
                          height: 45.0,
                          child: new RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.blue,
                            child: new Text('Send',
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            onPressed: () {
                              _sendMessage();
                            },
                          )))),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      ApiCommonDao.sendMessageToSchool(
              userId, _selectValue.id.toString(), _title, _description)
          .then((res) {
        if (res) {
          Fluttertoast.showToast(
              msg: 'Send Message Complete',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
              textColor: Colors.black);
          setState(() {
            _clear1.clear();
            _clear2.clear();
          });
        }
      });
    }
  }
}
