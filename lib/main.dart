import 'package:flutter/material.dart';
import 'package:sms_parent/screens/login/login_screen.dart';
import 'package:sms_parent/screens/home/home_screen.dart';
import 'package:sms_parent/screens/exam/exam_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sms_parent/util/app_translations_delegate.dart';
import 'package:sms_parent/util/application.dart';
import 'package:fluro/fluro.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/dao/authdao.dart';
import 'package:connectivity/connectivity.dart';
import 'package:sms_parent/util/commonComponent.dart';

void main(){

runApp(new MyApp());
}

class MyApp extends StatefulWidget {
   @override
  _MyAppState createState() => _MyAppState();

}
  
  class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;


// Language

  var isLogin = false;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    checkLoginInit();
        
      }
    
     void checkLoginInit()async{
       AuthManager.checkLogin().then((res){
         isLogin = res;
       });

    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
    
    _showDailog();
      
        }
    
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
          router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return new HomeScreen();
          }));
        // Define our Login page.
          router.define('login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return new LoginScreen();
          }));
        
        // Define our Login page.
          router.define('exam', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            String _title = params["title"]?.first;
            return new ExamScreen(title: _title,);
          }));
        
        
        
          // Defind Router
          Application.router = router;
        
             return new MaterialApp(
              title: 'AVASMS',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(        
                primarySwatch: Colors.lightBlue,
                fontFamily: 'Myanmar'
              ),
              onGenerateRoute: Application.router.generator,
              home:isLogin?new HomeScreen():new LoginScreen(),
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
    
      void _showDailog() {
          CommonComponents.showAlertDialog(context,"Please Open Wifi or Mobile Data","Connection Check");
      }
    
     
}
