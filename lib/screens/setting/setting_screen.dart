import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    title: 'Setting',
    home: Setting(),
  ));
}

class Setting extends StatefulWidget {
  SettingPage createState() => new SettingPage();
}

class SettingPage extends State<Setting> {
  String _oldPassward = '';
  String _newPassward = '';
  String _confirmPassward = '';
  bool _obsureText = true;
  IconData _passVisible = Icons.visibility_off;
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _login() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        Fluttertoast.showToast(
            msg: 'Passward is not match',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            bgcolor: '#ffffff',
            textcolor: '#d50000');
      } else {
        Fluttertoast.showToast(
          msg: 'Go',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
    final oldPassward = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _oldPassward = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter old Passward';
        }
      },
      decoration: InputDecoration(
        labelText: 'Old Passward',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
        
      ),
    );
    final newPassward = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _newPassward = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter New Passward';
        }
      },
      decoration: InputDecoration(
        labelText: 'New Passward',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
        
      ),
    );

    final confirmPassward = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _confirmPassward = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Old Passward';
        }
      },
      decoration: InputDecoration(
        labelText: 'Confirm New Passward',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
        
      ),
    );

    final submit = Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Colors.indigo[200],
          elevation: 1.0,
          child: MaterialButton(
            minWidth: 170.0,
            height: 40.0,
            onPressed: () {
              _login();
            },
            color: Colors.blueAccent,
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));

    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: new ClipRect(
        child: Card(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  children: <Widget>[
                    oldPassward,
                    newPassward,
                    confirmPassward,
                    submit,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
