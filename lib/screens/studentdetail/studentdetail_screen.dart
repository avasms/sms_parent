import 'package:flutter/material.dart';
import 'package:sms_parent/screens/studentdetail/info/infoscreen.dart';
import 'package:sms_parent/screens/studentdetail/attendant/attendant_screen.dart';
import 'package:sms_parent/screens/studentdetail/payment/payment_screen.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/models/studentInfo.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/util/app_translation.dart';

class StudentDetailScreen extends StatefulWidget {
  final studentId;
  const StudentDetailScreen({Key key, this.studentId}) : super(key: key);
  
  //_AboutScreen createState() => new _AboutScreen();
  _AboutStudent createState()=>new _AboutStudent();
}

class _AboutStudent extends State<StudentDetailScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      appBar:AppBar(title: new Text(
            AppTranslations.of(context).text("detail"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
      body: FutureBuilder<StudentInfo>(
        future: new ApiCommonDao().viewStudentInfo(widget.studentId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? About(stud: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class About extends StatefulWidget{
  final stud;
  About({this.stud});
  _AboutScreen createState()=>new _AboutScreen();
}
class _AboutScreen extends State<About> with SingleTickerProviderStateMixin{
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
    
    StudentInfo student=widget.stud; 
    final studId=student.id;
    return new Scaffold(
      
      body:new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: new Column(
        children: <Widget>[
          new Stack(
            alignment: const Alignment(0.0, 1.1),
            children: <Widget>[
              CircleAvatar(
                backgroundImage: new NetworkImage(Config.BASE_URL +student.photoPath,),
          radius: 60.0,
        ),
        
            ],
          ),
          new Container(
            alignment: const Alignment(0.0, 0.0),
          decoration: BoxDecoration(
            //color: Colors.white,
          
          ),
          child: Text(
            student.name,
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
            indicatorColor: Colors.redAccent,
              controller: _controller,
              tabs: [
                new Tab(
                  icon: const Icon(Icons.satellite,),
                  
                ),
                /*new Tab(
                  icon: const Icon(Icons.schedule),
                ),
                new Tab(
                  icon: const Icon(Icons.payment),
                  //text: 'Address',
                ),*/
              ],
            ),
          ),
          new Container(
            height: MediaQuery.of(context).size.width,
            //height:350.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                new InfoScreen(student: student),
                //new AttendantScreen(studentId: studId),
                //new PaymentScreen(studentId: studId,),
              ],
            ),
          ),
         
        ],
      ),
                ),
              ),
            ],
          ),
        ],
      ),
      /*body:new ListView(
        children: <Widget>[
          new Stack(
            alignment: const Alignment(0.0, 1.1),
            children: <Widget>[
              CircleAvatar(
                child: new CachedNetworkImage(
                            imageUrl: Config.BASE_URL +student.photoPath,
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
            student.name,
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
                ),
                new Tab(
                  icon: const Icon(Icons.schedule),
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
                new InfoScreen(student: student),
                new AttendantScreen(studentId: studId),
                new PaymentScreen(studentId: studId),
              ],
            ),
          ),
         
        ],
      ),*/
    );
  }
}