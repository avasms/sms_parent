import 'package:flutter/material.dart';
import 'monscreen.dart';
import 'tuescreen.dart';
import 'wedscreen.dart';
import 'thursday.dart';
import 'friscreen.dart';
import 'satscreen.dart';
import 'sunscreen.dart';

void main() {
  runApp(MyApp());
}
List<String> categories = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(

                   
            bottom: TabBar(
              isScrollable: true,
               tabs:
               [
                Tab(text:'MON'),
                 Tab(text: 'TUE',),
                 Tab(text:'WED'),
                 Tab(text: 'THU',),
                 Tab(text: 'FRI',),
                Tab(text: 'SAT',),
                Tab(text: 'SUN',),
               ],
            ),
            title: Text('Student Time Table'),
          ),
          body: TabBarView(
           
            children: [
              new MonPage(),
              new TuePage(),
              new WedPage(),
              new ThuPage(),
              new FriPage(),
              new SatPage(),
              new SunPage(),
              
              
          //     ListView(
                
          // children: <Widget>[
            
                // MaterialApp(
               
                //   routes: {

                //   '/second': (context) => MonScreen(),
                //   },
                // ),
                     
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //      new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //                        new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
                  
        //   ],
        // ),
        //      ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
        //       ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
        //       ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
        //      ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
        //     ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
        //     ListView(
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Myanmar'+'                       '+'90:00  -  10:30'),  
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('English'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //     ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Math'+'                               '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Physics'+'                           '+'90:00  -  10:30'),
               
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Chemistry'+'                       '+'90:00  -  10:30'),
              
        //     ),
        //    new Divider(
        //     color: Colors.red,
        //   ),
        //                 ListTile(
        //       leading: Icon(Icons.star),
        //       title: Text('Biology'+'                            '+'90:00  -  10:30'),
               
        //     ),
        //   new Divider(
        //     color: Colors.red,
        //   ),

        //   ],
        // ),
            ],
          ),
        ),
      ),
    );
  }
}
