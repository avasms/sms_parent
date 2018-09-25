
import 'package:flutter/material.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/exam.dart';



class ExamScreen extends StatefulWidget {
  final classId;
  ExamScreen({Key key, this.classId}) : super(key: key);
  _ExamScreenState createState() => _ExamScreenState();

  
}

class _ExamScreenState extends State<ExamScreen> {
 List<Exam> list = List();
 var isLoading = false;
    

  @override
 void initState() {
    super.initState();
    _selectExamWith(widget.classId);
      } 
     
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text("View Exam"),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
    
            ),
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Column(
                        children: <Widget>[
                          new ListTile(
                        leading: Icon(Icons.star),
                        title: new Text(list[index].name),
                    onTap: (){
                        Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/exam');
                      }
    
                      ),
                      new Divider(color: Colors.red,height: 4.0,)
                        ],
                      );
                      
     
                    }));
      }
    
      void _selectExamWith(classId) {
      ApiCommonDao dao = new ApiCommonDao();
      dao.getExamListByClassId(classId).then((res){
        isLoading = true;
        list = res;
      });
      }
}
