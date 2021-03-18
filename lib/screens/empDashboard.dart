import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/dashboardCard.dart';

class EmpDashboard extends StatefulWidget {
  static const String id = 'empDashboard';

  @override
  _EmpDashboardState createState() => _EmpDashboardState();
}

class _EmpDashboardState extends State<EmpDashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              color: Colors.black,
            )
          ],
          title: Text(
            'Dashboard',
            style: kappBarText,
          ),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0
                            ),
            indicatorColor: kSecondColor  ,            
            tabs: [
              Tab(text: 'OVERVIEW',),
              Tab(text: 'EXPENSE STAT'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverView(),
            OverView(),
          ],
                  
        ),
      ),
    );
  }
}


