import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/models/dormitory.dart';
import 'package:sms_parent/dao/apicommondao.dart';


class DormitoryListData extends StatelessWidget {
  static const String routeName = '/material/two-level-list';
 final List<Dormitory> stu;

  const DormitoryListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Domority List ')),
       body: FutureBuilder<List<Dormitory>>(
        future: new ApiCommonDao().fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? StudentList(transport: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
    
  }
}
class StudentList extends StatelessWidget {
  final List<Dormitory> transport;
StudentList({Key key, this.transport}) : super(key: key);
  //StudentList({Key key, this.student}) : super(key: key);
  
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
         itemCount: transport.length,
         itemBuilder: (context, index) {
         final item=transport[index];
     //     const ListTile(title: Text('Student List')),
        return   ExpansionTile(
              title:  Text('Transport Name:${item.name}'),
             backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              
             children:  <Widget>[
             new Container(height: 15.0,),
             ListTile(
            leading: Icon(Icons.person),
             title: Text('School Name :${item.schoolName} '),
           /*   onTap: () {
                 Navigator.push(
                  context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
              },*/
             subtitle: new RichText(    
             text: new TextSpan(
             //text: 'Driver Name: U Maung Maung\n ' ,
             style: DefaultTextStyle.of(context).style,
             children: <TextSpan>[
             new TextSpan(text:'Description :${item.description}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
              new TextSpan(text:'Room No.:${item.roomNo}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
             new TextSpan(text: 'Teacher Name :${item.teacherName}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),),
           
            ],
              ),
            ),
          
      
            ),
             //  ListTile(title: Text('Two')),
              // ListTile(title: Text('Free')),
             //  ListTile(title: Text('Four'))
            ]
          );
          // const ListTile(title: Text('Bottom'))
    
        }
      );
    
        
  }
}