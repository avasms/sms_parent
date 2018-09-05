import 'package:flutter/material.dart';
import 'package:sms_parent/screens/login/login_screen.dart';
import 'package:sms_parent/screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sms_parent/util/app_translations_delegate.dart';
import 'package:sms_parent/util/application.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
   @override
  _MyAppState createState() => _MyAppState();
}

  // Route
  final routes = <String, WidgetBuilder>{   
    '/home': (BuildContext context) => new HomeScreen(),
    '/': (BuildContext context) => new LoginScreen(),
  };

  class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;


// Language



  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

 void onLocaleChange(Locale locale) {
    setState(() {
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

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
      localizationsDelegates: [
         _newLocaleDelegate,
        const AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    ); 
  }
}
