import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/historyCard.dart';

class ExpenseHistory extends StatefulWidget {
  static const String id = 'ExpenseHistory';

  @override
  _ExpenseHistoryState createState() => _ExpenseHistoryState();
}

class _ExpenseHistoryState extends State<ExpenseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFBFBFB),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                    HistoryContainer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
