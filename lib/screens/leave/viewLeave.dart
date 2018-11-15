import 'package:flutter/material.dart';
import 'package:sms_parent/screens/leave/detailleave.dart';
import 'package:sms_parent/screens/leave/leavedata.dart';
import 'package:sms_parent/models/leave.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class ViewLeaveScreen extends StatefulWidget {
  final userId;
  final studentId;
  ViewLeaveScreen({Key key, this.userId,this.studentId}) : super(key: key);

  VeiwLeave createState() => new VeiwLeave();
}

class VeiwLeave extends State<ViewLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Leave>>(
      future: new ApiCommonDao().viewLeaveData(widget.userId,widget.studentId),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ViewLeaveDataScreen(viewData: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ViewLeaveDataScreen extends StatelessWidget {
  List<Leave> viewData;
  ViewLeaveDataScreen({this.viewData});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
          itemCount: viewData.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            final item = viewData[position];
            Leave data = viewData[position];
            double c_width = MediaQuery.of(context).size.width * 0.8;
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                    title: Text(
                      '${item.adminName}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Serif',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: new Container(
                      width: c_width,
                      height: 25.0,
                      child: new Chip(
                        backgroundColor: Colors.white24,
                        label: new Text(
                          '${item.description}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Serif',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    leading: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 25.0,
                          child: Icon(Icons.person),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new MessageView(data: item)));
                    }),
              ],
            );
          }),
    );
  }
}
