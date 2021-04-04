import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';

class VerifyExpense extends StatefulWidget {
  static const String id = 'verifyExpense';

  @override
  _VerifyExpenseState createState() => _VerifyExpenseState();
}

class _VerifyExpenseState extends State<VerifyExpense> {
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
            title: 'Verify Expense',
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
              children: [],
            );
          },
        ),
      ),
    );
  }
}
