import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/screens/login/login_screen.dart';

class Setting extends StatefulWidget {
  String userId;
  SettingPage createState() => new SettingPage();
  Setting({Key key, this.userId}) : super(key: key);
}

class SettingPage extends State<Setting> {
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';
  TextEditingController _oldpassctrl = new TextEditingController();
  TextEditingController _passctrl = new TextEditingController();
  TextEditingController _confirmpassctrl = new TextEditingController();
  bool _obsureText = true;
  IconData _passVisible = Icons.visibility_off;
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final oldPassword = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _oldPassword = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter old Password';
        }
      },
      controller: _oldpassctrl,
      decoration: InputDecoration(
        labelText: 'Old Passward',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
      ),
    );
    final newPassword = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _newPassword = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter New Password';
        }
      },
      controller: _passctrl,
      decoration: InputDecoration(
        labelText: 'New Password',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
      ),
    );

    final confirmPassword = new TextFormField(
      autofocus: false,
      obscureText: _obsureText,
      onSaved: (value) => _confirmPassword = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Confirm Password';
        }
      },
      controller: _confirmpassctrl,
      decoration: InputDecoration(
        labelText: 'Confirm New Password',
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
      ),
    );

    _changePass() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (_newPassword != _confirmPassword) {
          Fluttertoast.showToast(
              msg: 'New Passward and Confirm Password is not match',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 3,
              backgroundColor: Colors.white,
              textColor: Colors.teal);
        } else {
          // check old password and userid match

          String _id = widget.userId.trim();
          ApiCommonDao.checkOldPassword(
                  _id, _oldPassword.trim(), _confirmPassword.trim())
              .then((res) {
            if (res) {
              Fluttertoast.showToast(
                  msg: 'Password changed Successfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 3,
                  backgroundColor: Colors.white,
                  textColor: Colors.teal);
              setState(() {
                _oldpassctrl.clear();
                _passctrl.clear();
                _confirmpassctrl.clear();
              });
            } else {
              Fluttertoast.showToast(
                  msg: 'Old password is not match',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 3,
                  backgroundColor: Colors.white,
                  textColor: Colors.teal);
            }
          });
        }
      }
    }

    final submit = Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Colors.indigo[200],
          elevation: 1.0,
          child: MaterialButton(
            minWidth: 170.0,
            height: 50.0,
            onPressed: () {
              _changePass();
              _showDialog();
                          },
                          color: Colors.blueAccent,
                          child: Text(
                            'Change',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ));
              
                  return Scaffold(
                    appBar: new AppBar(
                        backgroundColor: Colors.indigo.shade700,
                        title: new Text(
                          'Setting',
                          style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
                        )),
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
                                  oldPassword,
                                  newPassword,
                                  confirmPassword,
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
              
                void _showDialog() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        //title: new Text('Are you go to login page?'),
                        content: new Text('Are you go to login page?'),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('No'),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          new FlatButton(
                            child: new Text('Yes'),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>new LoginScreen()
                              ));
                            },
                          ),
                        ],
                      );
                    }
                  );
                }
}
