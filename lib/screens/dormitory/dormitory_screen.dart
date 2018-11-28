import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/models/dormitory.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/app_translation.dart';


class DormitoryListData extends StatelessWidget {
  final List<Dormitory> stu;

  const DormitoryListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("dormitory_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
      body: FutureBuilder<List<Dormitory>>(
        future: new ApiCommonDao().getDormitoryList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(dormitory: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final List<Dormitory> dormitory;
  StudentList({Key key, this.dormitory}) : super(key: key);
  //StudentList({Key key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dormitory.length,
        itemBuilder: (context, index) {
          final item = dormitory[index];
          return Card(
            color: Colors.white,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: new ExpansionTile(
                title: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppTranslations.of(context)
                              .text("dormitory_name"),
                          style: TextStyle(fontFamily: 'Myanmar')),
                      TextSpan(
                          text: ' : ${item.name}',
                          style: TextStyle(fontFamily: 'Zawgyi')),
                    ],
                  ),
                ),
                backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  new Container(
                    height: 15.0,
                  ),
                  ListTile(
                    
                    leading:new Padding(
                      padding:EdgeInsets.only(bottom: 70.0),
                      child: Icon(
                      Icons.home,
                      size: 35.0,
                    ),),
                    title: new Container(
                      child: new Column(children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              width: 100.0,
                              child: new Text(
                                AppTranslations.of(context)
                                    .text("common_school"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${(item.schoolName==null)?'':item.schoolName}',
                                  style: TextStyle(
                                      fontFamily: 'Zawgyi', fontSize: 16.0)),
                            ),
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              width: 100.0,
                              child: new Text(
                                AppTranslations.of(context).text("common_description"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${(item.description==null)?'':item.description}',
                                  style: TextStyle(
                                      fontFamily: 'Zawgyi', fontSize: 16.0)),
                            ),
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              width: 100.0,
                              child: new Text(
                                  AppTranslations.of(context).text("room_no"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${(item.roomNo==null?'':item.roomNo)}',
                                  style: TextStyle(
                                      fontFamily: 'Zawgyi', fontSize: 16.0)),
                            ),
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              width: 100.0,
                              child: new Text(
                                AppTranslations.of(context).text("teacher"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(
                                ': ${(item.teacherName==null)?'':item.teacherName==null}',
                                style: TextStyle(
                                    fontFamily: 'Zawgyi', fontSize: 16.0),
                                //overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    
                  ),
                ]),
          );

        });
  }
}
