import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/screens/leave/viewLeave.dart';


class LeaveScreen extends StatelessWidget {
  final String parentId;

  const LeaveScreen({Key key, this.parentId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade700,
            title: 
              new Text(AppTranslations.of(context).text("leave_menu"),style: TextStyle(fontFamily: 'Myanmar'))
            ,
            bottom: TabBar(
              labelColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: 'Create Leave ',
                ),
                Tab(
                  text: 'View Leave',
                ),
                
               
              ],
            ),
          ),
          body: TabBarView(
            children: [
             // new CreateLeaveScreen(parentId: parentId),
              new ViewLeaveScreen(),
                           
            ],
          ),
        ),
      ),
    );
  }
}
