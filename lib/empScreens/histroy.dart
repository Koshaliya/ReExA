import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'expenseHistory.dart';
import 'topUpHistory.dart';
class History extends StatefulWidget {
  static const String id = 'history';

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            SearchButton(),
            NotificationButton()
          ],
          title: AppBarTitle(title: 'History',),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0
                            ),
            indicatorColor: kSecondColor  ,            
            tabs: [
              Tab(text: 'Expense History',),
              Tab(text: 'Top-up History'),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            ExpenseHistory(),
            TopUpHistory(),
          ],
                  
        ),
      ),
    );
      
    
  }
}

