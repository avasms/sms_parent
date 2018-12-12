import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/util/application.dart';
import 'package:fluro/fluro.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StudentListData extends StatelessWidget {
  final String parentId;
  final String screenType;
  final String userId;
  const StudentListData({Key key, this.parentId, this.screenType,this.userId})
      : super(key: key);


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: new AppBar(
           backgroundColor: Colors.indigo.shade700,
           title: new Text(
             AppTranslations.of(context).text("child_menu"),
             style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
           )),
       body: FutureBuilder<List<Student>>(
         future: new ApiCommonDao().getStudentList(this.parentId),
         builder: (context, snapshot) {
           if (snapshot.hasError) print(snapshot.error);
 
           return snapshot.hasData
               ? StudentList(
                   student: snapshot.data,
                   screenType: screenType,
                   parentId: this.parentId,
                   userId: this.userId,
                 )
               : Center(child: CircularProgressIndicator());
         },
       ),
     );
   }
 
}

class StudentList extends StatefulWidget {
  final List<Student> student;
  final String screenType;
  final String parentId,userId;

  StudentList({Key key, this.student, this.screenType, this.parentId,this.userId}) : super(key: key);

  @override
  StudentListState createState() {
    return new StudentListState();
  }
}

class StudentListState extends State<StudentList> {
  TransitionType transitionType = TransitionType.native;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.student.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.student[index];

          return new SafeArea(
            top: false,
            bottom: false,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          switch (widget.screenType) {
                            case Config.STUDENT_SCREEN:
                             Application.router.navigateTo(context,
                                  "studentScreen?studentId=${item.id.toString()}",
                                  transition: transitionType, replace: false
                                  );
                              break;
                            case Config.EXAM_SCREEN:
                              Application.router.navigateTo(
                                  context,
                                  "exam?classId=" +
                                      item.classLevelId.toString(),
                                  transition: transitionType,
                                  replace: false);
                              break;
                            case Config.GRADE_SCREEN:
                              Application.router.navigateTo(context,
                                  "grade?studentId=" + item.id.toString(),
                                  transition: transitionType, replace: false);
                              break;
                            case Config.TIMETABLE_SCREEN:
                              Application.router.navigateTo(
                                  context,
                                  "timetable?sectionId=" +
                                      item.sectionId.toString(),
                                  transition: transitionType,
                                  replace: false);
                              break;
                              case Config.LEAVE_SCREEN:
                              Application.router.navigateTo(context,
                                  "leave?studentId=" + item.id.toString()+"&userId="+widget.userId+"&studentName="+item.name.toString(),
                                  transition: transitionType, replace: false);
                              break;
                          }
                        },
                        leading: new CircleAvatar(
                          backgroundColor: Colors.white,
                          child: new CachedNetworkImage(
                            imageUrl: Config.BASE_URL + item.photoPath,
                            placeholder: new CircularProgressIndicator(),
                            errorWidget: new Icon(Icons.error),
                          ),
                          maxRadius: 50.0,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: 35.0,
                        ),
                        title: Text(
                          AppTranslations.of(context).text("common_name")+'\n',
                          maxLines: 1,
                          style: new TextStyle(
                              fontFamily: 'Myanmar',
                              color: Colors.blue[700],
                              fontSize: 17.0,
                              ),
                        ),
                        subtitle: new RichText(
                          text: new TextSpan(
                          
                            style: DefaultTextStyle.of(context).style,

                            children: <TextSpan>[
                              new TextSpan(
                                text: '${item.name}\n',
                                style: new TextStyle(
                                    fontFamily: 'Zawgyi',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    ),
                              ),
                              new TextSpan(
                                text:  AppTranslations.of(context).text("common_class"),
                                style: new TextStyle(
                                  fontFamily: 'Myanmar',
                                    color: Colors.blue[700],
                                    fontSize: 17.0,
                                    ),
                              ),
                              new TextSpan(
                                text: '\n${item.className}',
                                style: new TextStyle(
                                    fontFamily: 'Zawgyi',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    ),
                              ),
                              // new TextSpan(text: 'Year     -${item.runningYear}\n',
                              //  style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),),
                              //new TextSpan(text: 'School    -${item.schoolName}\n',
                              // style: new TextStyle(color: Colors.black,fontSize: 16.0,wordSpacing:2.0),),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
