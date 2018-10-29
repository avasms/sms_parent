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
              ? ExamSubjectList(examList: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ExamSubjectList extends StatelessWidget {
  final List<Exam> examList;

  ExamSubjectList({Key key, this.examList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: ListView.builder(
          shrinkWrap: true,
          padding: new EdgeInsets.all(0.0),
          itemCount: examList.length,
          itemBuilder: (context, index) {
            final item = examList[index];
            return Card(
              color: Colors.white,
              child: new ExpansionTile(

                title: Text('Exam Name:${item.name}',style: TextStyle(fontFamily: 'Zawgyi'),textAlign:TextAlign.start,),
               
               leading: Icon(Icons.text_fields),
                backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.025),
                children: <Widget>[
                  new Column(
                    children: _buildExamDetailChild(item),
                  ),
                 
                ]
                ),
            );
            
          }
          
          ),
    );
  }

  _buildExamDetailChild(Exam item) {
    List<Widget> columnContent = [];

    for (ExamDetail sub in item.examSubList)
      columnContent.add(new Column(
     crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           new Divider(color: Colors.red,height: 4.0,),
          new Row(children: <Widget>[
            new Expanded(
              child: new Text(sub.name!=null?sub.name:'',textAlign: TextAlign.start,
              style: TextStyle(fontFamily:'Zawgyi' ),),
            ),
             new Expanded(
              child: new Text(sub.examDateFrom!=null?sub.examDateFrom:'',textAlign: TextAlign.end,),
            ),
             new Expanded(
              child: new Text(sub.startTime!=null&&sub.endTime!=null?sub.startTime+'\n'+sub.endTime:'',textAlign: TextAlign.end,),
            )

          ]
          ),
       
      
        ],
       
      )
      
      );

    return columnContent;
  }
}
