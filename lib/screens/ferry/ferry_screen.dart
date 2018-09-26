import 'package:sms_parent/dao/apicommondao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/models/ferry.dart';
import 'package:sms_parent/util/app_translation.dart';


class TransportListData extends StatelessWidget {
  
 final List<Transport> stu;

  const TransportListData({Key key, this.stu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
       backgroundColor: Colors.indigo.shade700,
       title: new Text(AppTranslations.of(context).text("ferry_menu"),style: TextStyle(fontFamily: 'Myanmar',color: Colors.white),)
       ),
       body: FutureBuilder<List<Transport>>(
        future: new ApiCommonDao().getFerryList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? FerryList(transport: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
    
  }
}
class FerryList extends StatelessWidget {
  final List<Transport> transport;
FerryList({Key key, this.transport}) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
         itemCount: transport.length,
         itemBuilder: (context, index) {
         final item=transport[index];
     //     const ListTile(title: Text('Student List')),
        return ExpansionTile(
              title:  Text('Transport Name:${item.name}'),
             backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              
             children:  <Widget>[
             new Container(height: 15.0,),
             ListTile(
            leading: Icon(Icons.directions_bus,size: 50.0,),
             title: Text('School Name :${item.schoolName} '),
             subtitle: new RichText(    
             text: new TextSpan(
             //text: 'Driver Name: U Maung Maung\n ' ,
             style: DefaultTextStyle.of(context).style,
             children: <TextSpan>[
             new TextSpan(text:'Route Far :${item.routeFare}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
              new TextSpan(text:'Vehical No.:${item.vehicleNo}\n',
             style: new TextStyle(color: Colors.black,fontSize: 16.0,),
             ),
             new TextSpan(text: 'Driver Name :${item.driverName}\n',
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