import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/login/login_screen.dart';
import 'package:sms_parent/screens/home/home_screen.dart';
import 'package:sms_parent/screens/leave/leave_screen.dart';
import 'package:sms_parent/screens/exam/exam_screen.dart';
import 'package:sms_parent/screens/examgrade/grade_screen.dart';
import 'package:sms_parent/screens/notice/noticeboard.dart';
import 'package:sms_parent/screens/timetable/timetable_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sms_parent/util/app_translations_delegate.dart';
import 'package:sms_parent/util/application.dart';
import 'package:fluro/fluro.dart';
import 'package:sms_parent/dao/authdao.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms_parent/screens/dormitory/dormitory_screen.dart';
import 'package:sms_parent/screens/ferry/ferry_screen.dart';
import 'package:sms_parent/screens/student/student_screen.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/screens/setting/setting_screen.dart';
import 'package:sms_parent/util/dbhelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:sms_parent/util/commonComponent.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  FirebaseMessaging message = new FirebaseMessaging();

  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
// Language
  Widget _defaultHome = new LoginScreen();
  @override
  void initState() {
    
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Fluttertoast.showToast(
            msg: "Plese Open Mobile Data or Wifi",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 20,
            bgcolor: '#ffffff',
            textcolor: '#d50000');
      }
    });

  // Message 

 // TODO: implement initState
    

    message.configure(
      onLaunch: (Map<String, dynamic> msg) {
      print("OnLaunch called $msg");
    }, onResume: (Map<String, dynamic> msg) {
      print("onResume called $msg");
      //m=msg.toString();
      //showNotification(msg);
      
    }, onMessage: (Map<String, dynamic> msg) {
      showNotification(msg);
      //convertMessage(msg);
      print("onMessage called: $msg");
    });
    
    message.requestNotificationPermissions(const IosNotificationSettings(
      sound: true,
      alert: true,
      badge: true,
    ));
    message.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
      print("Ios Setting Register");
    });
    message.getToken().then((token) {
      update(token);
    });
    checkLoginInit();

    super.initState();
  }


  update(String token) {
    print(token);
    //textvalue = token;
  }

Future showNotification(Map<String, dynamic> msg) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Notification"),
              content: Text(msg.toString()),
              actions: <Widget>[
                new FlatButton(
                  child: Text('OK'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                  child: Text('Cancle'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
  Future convertMessage(Map<String,dynamic> message){
    print(message);
    //m=message.toString();

  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void checkLoginInit() async {
    var db = new DBHelper();
    db.getCount().then((data) {
      Fluttertoast.showToast(
          msg: data.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 20,
          bgcolor: '#ffffff',
          textcolor: '#d50000');
          if(data > 0){
            _defaultHome = new HomeScreen();            
          }
    });
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Create the router.
    Router router = new Router();
    // Define our Home page.
    router.define('home', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new HomeScreen();
    }));
    // Define our Login page.
    router.define('login', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new LoginScreen();
    }));

    // Define our Dormantory page.
    router.define('dormitory', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new DormitoryListData();
    }));

    // Define our Dormantory page.
    router.define('ferry', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new TransportListData();
    }));

    // Define our Student page.
    router.define('student', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _parentId = params["parentId"]?.first;
      String _screenType = params["screenType"]?.first;
      return new StudentListData(parentId: _parentId, screenType: _screenType);
    }));

    // Define our Grade page.
    router.define('grade', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _studentId = params["studentId"]?.first;
      return new ExamGradeListData(
        studentId: _studentId,
      );
    }));

// Define our Exam page.
    router.define('exam', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _classId = params["classId"]?.first;
      return new ExamScreen(
        classId: _classId,
      );
    }));

// Define our Time Table page.
    router.define('timetable', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _sectionId = params["sectionId"]?.first;
      return new TimeTable(
        sectionId: _sectionId,
      );
    }));

// Define our Time Table page.
    router.define('leave', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _pid = params["parentId"]?.first;
      return new LeaveScreen(
        parentId: _pid,
      );
    }));
//Define our Setting Page.
    router.define('setting', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _userid = params["userId"]?.first;
      return new Setting(
        userId: _userid,
      );
    }));

    //Define our Notice Page.
    router.define('notice', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new NoticeBoardScreen();
    }));
    // Defind Router
    Application.router = router;

    return new MaterialApp(
      title: 'AVASMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Myanmar'),
      onGenerateRoute: Application.router.generator,
      home: _defaultHome,
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

  Future<String> getLocalStorageData() async {
    return await LocalStorage.get(Config.USER_RELATED_ID);
  }

 
}
