import 'package:flutter/material.dart';
import 'package:sms_parent/models/studentPayment.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/app_translation.dart';


class PaymentScreen extends StatefulWidget {
  final studentId;

  const PaymentScreen({Key key, this.studentId}) : super(key: key);
  _PaymentScreen createState() => new _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<StudentPayment>>(
        future: new ApiCommonDao().viewStudentPayment(widget.studentId),
        builder: (context,snapshot){
          if (snapshot.hasError)print(snapshot.error);
          
          return snapshot.hasData
          ? Payment_screen(payment:snapshot.data)
          : Center(child: CircularProgressIndicator());
        },
      ),
    );
   
  }
}

class Payment_screen extends StatelessWidget{
  final List<StudentPayment> payment;
  Payment_screen({Key key, this.payment}) : super(key: key);
  @override
  Widget build(BuildContext context){
    
     return ListView.builder(
        itemCount: payment.length,
        itemBuilder: (context, index) {
          final item = payment[index];
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
                              .text("pay_name"),
                          style: TextStyle(fontFamily: 'Myanmar')),
                      TextSpan(
                          text: ' : ${item.payName}',
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
                    
                    /*leading:new Padding(
                      padding:EdgeInsets.only(bottom: 70.0),
                      child: Icon(
                      Icons.home,
                      size: 35.0,
                    ),),*/
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
                                    .text("student_name"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${item.studentName}',
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
                                AppTranslations.of(context).text("class"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${item.className}',
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
                                  AppTranslations.of(context).text("payment_date"),
                                  style: TextStyle(
                                      fontFamily: 'Myanmar', fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(': ${item.paymentDate}',
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
                                AppTranslations.of(context).text("balance"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(
                                ': ${item.balance}',
                                style: TextStyle(
                                    fontFamily: 'Zawgyi', fontSize: 16.0),
                                //overflow: TextOverflow.ellipsis,
                              ),
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
                                AppTranslations.of(context).text("pay_amount"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(
                                ': ${item.payAmount}',
                                style: TextStyle(
                                    fontFamily: 'Zawgyi', fontSize: 16.0),
                                //overflow: TextOverflow.ellipsis,
                              ),
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
                                AppTranslations.of(context).text("left_amount"),
                                style: TextStyle(
                                    fontFamily: 'Myanmar', fontSize: 16.0),
                              ),
                            ),
                            new Container(
                              width: 150.0,
                              child: new Text(
                                ': ${item.lastBalance}',
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
