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
    );

    final _descriptionForm = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
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
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0),
        contentPadding: EdgeInsets.all(15.0),
      ),
    );

    return new Center(
      child: new Container(
        child: new Card(
          color: Colors.white70,
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: new DropdownButtonHideUnderline(
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
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _titleForm,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _descriptionForm,
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
                        _sendMessage();
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

  void _sendMessage() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      ApiCommonDao.sendMessageToSchool(
              userId, _selectValue.id.toString(), _title, _description)
          .then((res) {
        if (res) {
          Fluttertoast.showToast(
              msg: 'Message sent Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 3,
              bgcolor: '#ffffff',
              textcolor: '#d50000');

          setState(() {
            _clear1.clear();
            _clear2.clear();
          });
        }
      });
    }
  }
}
