import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/mgrWidgets/mgrReportCard.dart';
import 'package:flutter/material.dart';

class MgrReport extends StatefulWidget {
    static const String id = 'mgrReport';
  @override
  _MgrReportState createState() => _MgrReportState();
}

class _MgrReportState extends State<MgrReport> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ScaffoldState scaffold;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [SearchButton(), NotificationButton()],
          title: AppBarTitle(
            title: 'Report',
          ),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            indicatorColor: kSecondColor,
            tabs: [
              Tab(
                text: 'Received',
              ),
              Tab(text: 'Sent'),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: Builder(
          builder: (BuildContext buildContext) {
            scaffold = Scaffold.of(buildContext);
            return TabBarView(
              children: [
                MgrInboxTab(),
                MgrSentTab(),
              ],
            );
          },
        ),
      ),
    );
  }
}

