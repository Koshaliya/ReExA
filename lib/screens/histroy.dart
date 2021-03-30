import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/historyCard.dart';
import 'expenseHistory.dart';

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
            'History',
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
              Tab(text: 'Expense History',),
              Tab(text: 'Top-up History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExpenseHistory(),
            ExpenseHistory(),
          ],
                  
        ),
      ),
    );
      
    
  }
}

