import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/screens/timetable/mon_screen.dart';

class TimeTable extends StatelessWidget {
  final String sectionId;

  const TimeTable({Key key, this.sectionId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade700,
            title: new Text(
              AppTranslations.of(context).text("timetable_menu"),
              style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: 'MON',
                ),
                Tab(
                  text: 'TUE',
                ),
                Tab(text: 'WED'),
                Tab(
                  text: 'THU',
                ),
                Tab(
                  text: 'FRI',
                ),
                Tab(
                  text: 'SAT',
                ),
                Tab(
                  text: 'SUN',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new MonScreen(sectionId: sectionId),
             
            ],
          ),
        ),
      ),
    );
  }
}
