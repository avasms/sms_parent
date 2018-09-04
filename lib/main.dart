import 'package:flutter/material.dart';
import 'package:sms_parent/screens/login/login_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // Route
  final routes = <String, WidgetBuilder>{   
   
    '/': (BuildContext context) => new LoginScreen(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      title: 'AVASMS',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(        
        primarySwatch: Colors.lightBlue,
      ),
      routes: routes,
      initialRoute: '/',
    ); 
  }
}
