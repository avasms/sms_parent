import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';
//import 'package:sms_parent/screens/login/login_screen.dart';

class HomeScreen extends StatefulWidget{
@override
_HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

String _selectLanguage = languagesList[0];
bool _enSelect = true;
// Change Method
void _changeLanguage() {
    // Causes the app to rebuild with the new _selectedChoice.
   if(_enSelect){
     _enSelect = false;
      setState(() {
      _selectLanguage = languagesList[0];
      
    }); 
    application.onLocaleChanged(Locale("en"));
    }else{
     _enSelect = true;
      setState(() {
     _selectLanguage = languagesList[1];
   }); 
   application.onLocaleChanged(Locale("my"));
    }
  }


@override
 Widget build(BuildContext context) {

   return new Scaffold(
        appBar: new AppBar(
          title: new Text(AppTranslations.of(context).text("test")),
          actions: <Widget>[
      FlatButton(
         onPressed: (){
           _changeLanguage();
         },
         child: new Text(_selectLanguage),
      )
          ],
        ),

    
   );
   
 }
}


const List<String> languagesList =  ["English", "Myanmar"];

