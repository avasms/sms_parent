import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //BuildContext _contx;
  // bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  
  // String _username, _password;
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
            Navigator.of(context).pushReplacementNamed("/home");            
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    
    final logo = Hero(
      tag: Hero,
      child: new Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: new Icon(
            Icons.school,
            size: 50.0,
          ),
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
    
      decoration: InputDecoration(
        labelText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
      ),
    );

    final companyTitle = new Center(
      child: new Container(
        child: new Text(
          'AVA SMS',
          style: new TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 50.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    final loginForm = new ClipRect(
      child: new Card(
        color: Colors.white,
        child: new Container(
          padding: EdgeInsets.all(25.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo,
                email,
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
          color: Colors.blueAccent,
        ),
        child: new Center(
          child: new ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              companyTitle,
              SizedBox(height: 30.0),
              loginForm,
            ],
          ),
        ),
      ),
    );
  }
}
