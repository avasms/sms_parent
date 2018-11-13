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
                      size: 50.0,
                    ),),
                    title: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("common_school"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.schoolName}',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                        ],
                      ),
                    ),
                    subtitle: new RichText(
                      text: new TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("common_description"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.description}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("room_no"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.roomNo}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("teacher"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.teacherName}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ),
                ]),
          );

          // const ListTile(title: Text('Bottom'))
        });
  }
}
