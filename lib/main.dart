import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_parent/models/user.dart';
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
import 'package:sms_parent/screens/dormitory/dormitory_screen.dart';
import 'package:sms_parent/screens/ferry/ferry_screen.dart';
import 'package:sms_parent/screens/student/student_screen.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/screens/setting/setting_screen.dart';
import 'package:sms_parent/util/dbhelper.dart';
import 'package:sms_parent/screens/studentdetail/studentdetail_screen.dart';
import 'package:sms_parent/screens/aboutschool/about_screen.dart';
import 'package:sms_parent/screens/attendant/attendant.dart';
import 'package:sms_parent/screens/payment/payment.dart';
import 'package:onesignal/onesignal.dart';

void main() async {
  var db = new DBHelper();
  User result = await db.getUser();
  bool _isLogin = false;
 
  if (result != null) {
    await LocalStorage.save(Config.TOKEN_KEY, result.tokenId);
    await LocalStorage.save(Config.USER_ID, result.userId);
    await LocalStorage.save(Config.USER_RELATED_ID, result.parentId);
    _isLogin = true;
  }
  
  runApp(new MyApp(loginStatus: _isLogin));
}

class MyApp extends StatefulWidget {
  final loginStatus;
 
  const MyApp({Key key, this.loginStatus}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    // Message
    super.initState();
    _getOneSignalData();
    _initMessageNotiState();
      }
    
      Future<void> _initMessageNotiState() async {
        if (!mounted) return;
        OneSignal.shared
            .setInFocusDisplayType(OSNotificationDisplayType.notification);
        OneSignal.shared.setNotificationReceivedHandler((notification) {
          this.setState(() {
            print(
                "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}");
          });
        });
    
        OneSignal.shared
            .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
          this.setState(() {
            print(
                "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
          });
        });
    
        OneSignal.shared
            .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
          print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
        });
    
        OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
          print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
        });
    
        OneSignal.shared.setEmailSubscriptionObserver(
            (OSEmailSubscriptionStateChanges changes) {
          print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
        });
        
      }
    
      @override
      void dispose() {
        super.dispose();
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
          String _userId = params["userId"]?.first;
          return new StudentListData(
              parentId: _parentId, screenType: _screenType, userId: _userId);
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
            handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          String _sid = params["studentId"]?.first;
          String _puid = params["userId"]?.first;
          String _sname = params["studentName"]?.first;
          return new LeaveScreen(
              userId: _puid, studentId: _sid, studentName: _sname);
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
          return new MessageScreen(userId: _userid);
        }));
    
        //Define our AboutSchool Page.
        router.define('aboutSchool', handler: new Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new AboutScreen();
        }));
    
        //Define our Student Detail Page.
        router.define('studentScreen', handler: new Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          String _sid = params["studentId"]?.first;
         
          return new StudentDetailScreen(
            studentId: _sid,
          );
        }));

        //Define our Student Attendance Page.
        router.define('attendant',handler: new Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params){
            String _attId=params["studentId"]?.first;
            return new AttendantScreen(studentId:_attId);
          }
        ));

        //Define our Student Payment Page.
        router.define('payment',handler: new Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params){
            String _payId=params["studentId"]?.first;
            return new PaymentScreen(studentId:_payId);
          }
        ));

    
        // Defind Router
        Application.router = router;
    
        return new MaterialApp(
          title: 'AVASMS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Zawgyi'),
          onGenerateRoute: Application.router.generator,
          home: widget.loginStatus ? new HomeScreen() : new LoginScreen(),
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
    
      void _getOneSignalData() async{

        var settings = {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.promptBeforeOpeningPushUrl: true
  };
//will delay initialization of the SDK
//make sure to call before init()
// For AVASMS Demo
  await OneSignal.shared.init("cecb6df8-3335-4db1-a26b-ed4b7f1c9ae3", iOSSettings: settings);
 // For MKL
 // await OneSignal.shared.init("37676ea9-017c-40fa-a0cc-91ae64c4c44b", iOSSettings: settings);
  // For TMD
  //await OneSignal.shared.init("2710339c-8a41-4a17-898f-c506fd907dea", iOSSettings: settings);  
  // For FAME
  //await OneSignal.shared.init("9fbc00b1-ae16-421a-a99b-383942356955", iOSSettings: settings);  
// the SDK will now initialize
  await OneSignal.shared.consentGranted(true);
//
var status = await OneSignal.shared.getPermissionSubscriptionState();
    print("One Signal UserID:${status.subscriptionStatus.userId}");

      }
}
