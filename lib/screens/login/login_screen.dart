import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:sms_parent/util/application.dart';
import 'package:sms_parent/dao/authdao.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _checkInternet();
  }

  void _checkInternet() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Check Internet"),
            content: new Text("Please Open Mobile Data or Wifi"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () => exit(0),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  //BuildContext _contx;
  // bool _isLoading = false;
  String _username, _password;

  bool _obscureText = true;
  final _formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  IconData _passVisible = Icons.visibility_off;
  TransitionType transitionType = TransitionType.native;

  void _login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //CommonComponents.showLoadingDialog(context);
      AuthManager.login(_username.trim(), _password.trim()).then((result) {
        if (result == null) {
          Fluttertoast.showToast(
              msg: "Username or Password is invalid!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.black);
        } else {
          Application.router.navigateTo(context, "home",
              transition: transitionType, replace: true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 170.0,
          height: 50.0,
          onPressed: () {
            _login();
          },
          color: Colors.blueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    _togglePassword() {
      setState(() {
        _obscureText = !_obscureText;
        if (_obscureText) {
          _passVisible = Icons.visibility_off;
        } else {
          _passVisible = Icons.visibility;
        }
      });
    }

    final logo = Hero(
      tag: Hero,
      child: Center(
        child: CircleAvatar(
            radius: 65.0,
            child: Image(
              image: AssetImage('images/avasms_logo.png'),
            )
            //   backgroundColor: Colors.transparent,
            // child: new Icon(
            //   Icons.school,
            //   size: 45.0,
            //  ),
            ),
      ),
    );

    final username = TextFormField(
      //keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onSaved: (value) => _username = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter username';
        }
      },
      decoration: InputDecoration(
        labelText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      onSaved: (value) => _password = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          suffixIcon: new GestureDetector(
            onTap: _togglePassword,
            child: new Icon(_passVisible),
          )),
    );

    final companyTitle = new Center(
      child: Container(
        child: Text(
          'AVA SMS',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    final loginForm = new ClipRect(
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo,
                username,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 22.0, right: 22.0),
            children: <Widget>[
              //companyTitle,
              SizedBox(height: 30.0),
              loginForm,
            ],
          ),
        ),
      ),
    );
  }
}
