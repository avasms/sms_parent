import 'package:flutter/material.dart';
import 'package:sms_parent/models/school.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/config.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  _AboutScreen createState() => new _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('About'),
      ),
      body: FutureBuilder<School>(
        future: ApiCommonDao().getSchoolInformation(),
        builder: (context, snapShot) {
          print(snapShot.data);
          return snapShot.hasData
              ? ShowData(school: snapShot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ShowData extends StatelessWidget {
  School school;
  ShowData({this.school});
  
  @override
  Widget build(BuildContext context) {
    var phone=school.phone;
    return new Container(
        //height: 800.0,
        //width: 500.0,
        child: ListView(
      children: <Widget>[
        new Stack(alignment: Alignment(0.0, 3.0), children: <Widget>[
          new Container(
            width: double.infinity,
            height: 230.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              image: new DecorationImage(
                image: NetworkImage(
                    Config.BASE_URL + '/Images/System/Background/login.jpg'),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                  color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            ),
          ),
          new CircleAvatar(
            radius: 80.0,
            child: new CachedNetworkImage(
              imageUrl: Config.BASE_URL + school.photoPath,
              placeholder: new CircularProgressIndicator(),
              errorWidget: new Icon(Icons.error),
            ),
          ),
        ]),
        new SizedBox(
          height: 80.0,
        ),
        new Center(
            child: new Text(
          '${school.schoolName}',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Serifs',
              fontWeight: FontWeight.w600),
        )),
        new Container(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Divider(
              height: 20.0,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new ListTile(
                leading: new Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 25.0,
                ),
                title: new Text('${school.address}'),
              ),
            ),
            new Divider(
              height: 20.0,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new ListTile(
                  leading: new InkWell(
                                    child: new Icon(Icons.mail,color: Colors.black,size: 25.0,),
                                    onTap: (){
                                      launch('mailto:${school.email}?subject=&body=');
                                    },
                                  ),
                  title: new InkWell(
                    child: new Text(
                      '${school.email}',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    onTap: () {
                      launch('mailto:${school.email}?subject=&body=');
                    },
                  )
                  //new Text('${school.email}'),
                  ),
            ),
            new Divider(
              height: 20.0,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new ListTile(
                  leading: new InkWell(
                    child: new Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 25.0,
                    ),
                    onTap: () {
                      launch('tel:${school.phone}');
                    },
                  ),
                  title: new InkWell(
                    child: new Text('${school.phone}',
                        style: TextStyle(color: Colors.lightBlue)),
                    onTap: () {
                      launch('tel:${school.phone}');
                    },
                  )),
            ),
            new Divider(
              height: 20.0,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new ListTile(
                leading: new Icon(
                  Icons.timelapse,
                  color: Colors.black,
                  size: 25.0,
                ),
                title: new InkWell(
                  child: new Text(
                    '${school.runningYear}',
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    ));
  }

}
