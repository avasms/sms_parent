import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sms_parent/models/admin.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'dart:async';

class AboutScreen extends StatefulWidget {
  _AboutScreen createState() => new _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AdminStaff>>(
      future: new ApiCommonDao().showschoolInformation(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ?  MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('About'),
        ),
        body: new ListView(
          children: <Widget>[
            new Stack(
              alignment: Alignment(0.0, 3.0),
              children: <Widget>[
            new Container(
              width: double.infinity,
              height:230.0,
              //child:new Image(
               //image: AssetImage('images/birds.jpg'),
               //fit:BoxFit.fill,
              //),
              decoration: new BoxDecoration(
                color: Colors.white,
                image: new DecorationImage(
                  image: AssetImage('images/school.jpg'),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                    color: Colors.grey, width: 1.0, style: BorderStyle.solid),
              ),
            ),
            new  CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
             ]),
             new SizedBox(
               height: 80.0,
             ),
             new Center(
               child:new Text('Wells  international school',style: TextStyle(fontSize: 20.0,fontFamily: 'Serif'),)
             ),
             new Container(
               
                       child: new Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         
                         children:<Widget>[
                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child:new Text('About',style: TextStyle(fontFamily: 'Serif',fontSize: 18.0,fontWeight: FontWeight.bold),),
                           ),
                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child:new Text('${snapshot.data.length}')
                             //child:new Text('A branch of EverClever Education Group, Ltd., Wells offers an American and IB university-preparatory curriculum to children from kindergarten to high school. Comprising three campuses in central Bangkok, it has expanded rapidly since its founding in 1999 and now serves approx. 1000 students who represent over two dozen nationalities. Wells is licensed by the Thai Ministry of Education, has been accredited by the Western Association of Schools and Colleges (WASC) since 2009, and is a member of the International Schools Association of Thailand (ISAT) and East Asia Regional Council of Schools (EARCOS). Please peruse our school profile, seen below, and feel free to contact us with any inquiries.'), 
                           ),
                           
                           
                           new Divider(height: 20.0,),
                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child: new ListTile(
                               leading: new Icon(Icons.location_on),
                               title: new Text('2209 Sukhumvit Road, Bangchak Prakhanong, Bangkok 10260'),
                             ),
                           ),
                           
                           new Divider(height: 20.0,),
                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child: new ListTile(
                               leading: new Icon(Icons.mail),
                               title: new Text('wells85@wells-school.com'),
                             ),
                           ),                           
                           new Divider(height: 20.0,),
                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child: new ListTile(
                               leading: new Icon(Icons.phone),
                               title: new Text('(66) 097-920-8511 / 02-730-3366'),
                             ),
                           ),
                          new Divider(height: 20.0,),
                          new Padding(
                             padding: EdgeInsets.all(10.0),
                             child: new ListTile(
                               leading: new Icon(Icons.pageview),
                               title: new InkWell(
                                 child: new Text(
                                    'https://wells.ac.th/',style: TextStyle(color: Colors.lightBlue,),
                                 ),
                                 /*onTap: (){
                                   _launchURL();
                                 },*/
                               ),
                             ),
                           ),
                          
                          ],
               )
             ),
          ],
        ),
      ),
    )
            : Center(child: CircularProgressIndicator());
      },
    ); 
  }
  }
  _launchURL() async {
  const url = 'https://wells.ac.th/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


