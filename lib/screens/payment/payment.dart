import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/models/studentPayment.dart';
import 'package:sms_parent/screens/studentdetail/attendant/attendant_screen.dart';
class PaymentScreen extends StatefulWidget{
  final studentId;
 const PaymentScreen({Key key, this.studentId}) : super(key: key);
  _PaymentScreen createState()=> new _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen>{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("payment_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          ),
      ),
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
          DateTime myDatetime = DateTime.parse(item.paymentDate);
          String date="${myDatetime.day}/${myDatetime.month}/${myDatetime.year}";
          return Card(
            color: Colors.white,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: new ExpansionTile(
              leading: Icon(Icons.attach_money,size: 29.0,color: Colors.black,),
                title: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppTranslations.of(context)
                              .text("pay_name"),
                          style: TextStyle(fontFamily: 'Myanmar')),
                      TextSpan(
                          text: ' : ${item.payName}',
                          style: TextStyle(fontFamily: 'Zawgyi',fontWeight: FontWeight.w500,color: Colors.black)),
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
                              child: new Text(': ${date}',
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
                                AppTranslations.of(context).text("left_balance"),
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