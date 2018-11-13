import 'package:flutter/material.dart';
import 'package:sms_parent/phyo/student/data_student.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sms_parent/phyo/student/info/infoscreen.dart';
import 'package:sms_parent/phyo/student/attendant/attendant_screen.dart';
import 'package:sms_parent/phyo/student/payment/payment_screen.dart';

class StudentScreen extends StatefulWidget {
  final Student data;
  StudentScreen({this.data,});
  _AboutScreen createState() => new _AboutScreen();
}

class _AboutScreen extends State<StudentScreen> with SingleTickerProviderStateMixin{
  TabController _controller;
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller=new TabController(length: 3,vsync: this);

    }
    @override
      void dispose() {
        // TODO: implement dispose
        super.dispose();
        _controller.dispose();
      }
  @override
  Widget build(BuildContext context) {
      Student screenstudent=widget.data;
    return new Scaffold(
      appBar:AppBar(
        title: Text('Detail'),
      ),
      body:new ListView(
        children: <Widget>[
          new Stack(
            alignment: const Alignment(0.0, 1.1),
            children: <Widget>[
              CircleAvatar(
          backgroundImage: AssetImage('images/birds.jpg'),
          radius: 80.0,
        ),
        
            ],
          ),
          new Container(
            alignment: const Alignment(0.0, 0.0),
          decoration: BoxDecoration(
            //color: Colors.white,
          
          ),
          child: Text(
            '${screenstudent.name}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily:'Serif' ,
              color: Colors.black,
            ),
          ),
        ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _controller,
              tabs: [
                new Tab(
                  icon: const Icon(Icons.satellite),
                  //text: 'Address',
                ),
                new Tab(
                  icon: const Icon(Icons.schedule),
                  //text: 'Location',
                ),
                new Tab(
                  icon: const Icon(Icons.payment),
                  //text: 'Address',
                ),
              ],
            ),
          ),
          new Container(
            height:500.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                new InfoScreen(student: screenstudent),
                new AttendantScreen(student: screenstudent),
                new PaymentScreen(),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}