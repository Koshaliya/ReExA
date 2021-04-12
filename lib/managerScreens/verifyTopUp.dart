import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/mgrWidgets/verifyTopUpCard.dart';

class VerifyTopUp extends StatefulWidget {
  static const String id = 'verifyTopUp';
  @override
  _VerifyTopUpState createState() => _VerifyTopUpState();
}

class _VerifyTopUpState extends State<VerifyTopUp> {
  ScaffoldState scaffold;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [SearchButton(), NotificationButton()],
          title: AppBarTitle(
            title: 'Verify Top-Up',
          ),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            indicatorColor: kSecondColor,
            
            tabs: [
              Tab(
                text: 'New',
              ),
              Tab(text: 'Pending'),
              Tab(text: 'Reviewed'),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: Builder(
          builder: (BuildContext buildContext) {
            scaffold = Scaffold.of(buildContext);
            return TabBarView(
              children: [
                VerifyTopUpNew(),
                VerifyTopUpNew(),
                VerifyTopUpNew(),
              ],
            );
          },
        ),
      ),
    );
  }
}