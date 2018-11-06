import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/screens/login/login_screen.dart';
import 'package:sms_parent/screens/home/home_screen.dart';
import 'package:sms_parent/screens/leave/leave_screen.dart';
import 'package:sms_parent/screens/exam/exam_screen.dart';
import 'package:sms_parent/screens/examgrade/grade_screen.dart';
import 'package:sms_parent/screens/notice/noticeboard.dart';
import 'package:sms_parent/screens/timetable/timetable_screen.dart';
import 'package:sms_parent/screens/message/message_screen.dart';
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

//import 'package:sms_parent/util/commonComponent.dart';

void main()async {
  var db = new DBHelper();
  var result = await db.getCount();
  bool _isLogin = false;
  if(result > 0 ){
_isLogin = true;
  }
  runApp(
    new MyApp(loginStatus: _isLogin)
    );
}

class MyApp extends StatefulWidget {
  final loginStatus;

  const MyApp({Key key, this.loginStatus}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();


}

class _MyAppState extends State<MyApp> {

  AppTranslationsDelegate _newLocaleDelegate;
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
// Language
  
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

 
  
    checkLoginInit();

    super.initState();
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

     //Define our Notice Page.
    router.define('message', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String _userid = params["userId"]?.first;
      return new MessageScreen(userId:_userid);
    }));


    // Defind Router
    Application.router = router;

    return new MaterialApp(
      title: 'AVASMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Zawgyi'),
      onGenerateRoute: Application.router.generator,
      home: widget.loginStatus?new HomeScreen(): new LoginScreen(),
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
