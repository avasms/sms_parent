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
          title: new Text(
            AppTranslations.of(context).text("ferry_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
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
          final item = transport[index];
          return Card(
            color: Colors.white,
            child: new ExpansionTile(
                title: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppTranslations.of(context).text("ferry_name"),
                          style: TextStyle(fontFamily: 'Myanmar')),
                      TextSpan(
                          text: ' : ${item.name}',
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
                    leading:new Padding(padding:EdgeInsets.only(bottom: 70.0),
                    child: Icon(
                      Icons.directions_bus,
                      size: 50.0,
                    ),
                    ),
                    title: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("common_school"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.schoolName}',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                        ],
                      ),
                    ),
                    subtitle: new RichText(
                      text: new TextSpan(
                        //text: 'Driver Name: U Maung Maung\n ' ,
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: AppTranslations.of(context).text("routes"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.routeFare}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                          TextSpan(
                              text: AppTranslations.of(context).text("car_no"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.vehicleNo}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                          TextSpan(
                              text: AppTranslations.of(context)
                                  .text("driver_name"),
                              style: TextStyle(fontFamily: 'Myanmar',fontSize: 16.0)),
                          TextSpan(
                              text: ' : ${item.driverName}\n',
                              style: TextStyle(fontFamily: 'Zawgyi',fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ),
                ]),
          );
        });
  }
}
