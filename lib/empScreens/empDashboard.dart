import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/dashboardCard.dart';

class EmpDashboard extends StatefulWidget {
  static const String id = 'empDashboard';

  @override
  _EmpDashboardState createState() => _EmpDashboardState();
}

class _EmpDashboardState extends State<EmpDashboard> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ScaffoldState scaffold;

  var userId;
  @override
  void didChangeDependencies() {


    var arguements =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    if (arguements != null) {
      userId = arguements['id'];
      print("userId:" + userId);
    }

    super.didChangeDependencies();
  }

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
            title: 'Dashboard',
          ),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            indicatorColor: kSecondColor,
            tabs: [
              Tab(
                text: 'OVERVIEW',
              ),
              Tab(text: 'EXPENSE STAT'),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: Builder(
          builder: (BuildContext buildContext) {
            scaffold = Scaffold.of(buildContext);
            return TabBarView(
              children: [
                OverView(),
                OverView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
