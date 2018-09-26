import 'package:flutter/material.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/exam.dart';
import 'package:sms_parent/util/app_translation.dart';

class ExamScreen extends StatefulWidget {
  final classId;
  ExamScreen({Key key, this.classId}) : super(key: key);
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("exam_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
      body: FutureBuilder<List<Exam>>(
        future: new ApiCommonDao().getExamListByClassId(widget.classId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ExamList(exam: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
class ExamList extends StatelessWidget {
  final List<Exam> exam;
  ExamList({Key key, this.exam}) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
         itemCount: exam.length,
         itemBuilder: (context, index) {
         
          return new Column(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.stars,size: 30.0,),
                title: new Text(exam[index].name,style:TextStyle(fontFamily: 'Zawgyi',fontSize: 20.0),),
              ),
              new Divider(height: 2.0,color: Colors.grey,),
              
            ],
          );
        
         }
         
    );
        
  }
}
