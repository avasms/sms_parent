import 'package:flutter/material.dart';
import 'package:sms_parent/screens/studentdetail/info/infoscreen.dart';
import 'package:sms_parent/screens/studentdetail/attendant/attendant_screen.dart';
import 'package:sms_parent/screens/studentdetail/payment/payment_screen.dart';
import 'package:sms_parent/models/student.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sms_parent/util/config.dart';

class StudentDetailScreen extends StatefulWidget {
  final studentId;
  final studentName;

  const StudentDetailScreen({Key key, this.studentId, this.studentName,}) : super(key: key);
  
  _AboutScreen createState() => new _AboutScreen();
}

class _AboutScreen extends State<StudentDetailScreen> with SingleTickerProviderStateMixin{
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
    //Student stud=widget.studentId;  
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
                child: new CachedNetworkImage(
                            imageUrl: Config.BASE_URL +widget.studentName,
                            placeholder: new CircularProgressIndicator(),
                            errorWidget: new Icon(Icons.error),
                          ),
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
            widget.studentName,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily:'Zawgyi' ,
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
                new InfoScreen(studentId: widget.studentId),
                new AttendantScreen(studentId: widget.studentId),
                new PaymentScreen(studentId: widget.studentId),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}