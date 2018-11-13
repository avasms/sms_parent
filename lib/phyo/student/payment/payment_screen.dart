import 'package:flutter/material.dart';
import 'package:newapp/student/data_student.dart';

class PaymentScreen extends StatefulWidget {
  _PaymentScreen createState() => new _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final item = students[index];
          return Card(
            color: Colors.white,
            child: new ExpansionTile(
                title: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Name', style: TextStyle(fontFamily: 'Serif')),
                      TextSpan(
                          text: ' : ${item.name}',
                          style: TextStyle(fontFamily: 'Serif')),
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
                    leading: Icon(
                      Icons.payment,
                      size: 50.0,
                    ),
                    title: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'School name',
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: ' : ${item.schoolName}',
                              style: TextStyle(fontFamily: 'Serif')),
                        ],
                      ),
                    ),
                    subtitle: new RichText(
                      text: new TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: "admissionNo",
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: ' : ${item.admissionNo}\n',
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: "classLevelId",
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: ' : ${item..classLevelId}\n',
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: "rollNo",
                              style: TextStyle(fontFamily: 'Serif')),
                          TextSpan(
                              text: ' : ${item.rollNo}\n',
                              style: TextStyle(fontFamily: 'Serif')),
                        ],
                      ),
                    ),
                  ),
                ]),
          );
        },
    );
  }
}
