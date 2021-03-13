import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/TodayMonthCard.dart';

class EmpDashboard extends StatefulWidget {
  @override
  _EmpDashboardState createState() => _EmpDashboardState();
}

class _EmpDashboardState extends State<EmpDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Column(
        //mainAxisAlignment: main,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'OVERVIEW',
                  style: kOverviewText,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'EXPENSE STAT',
                  style: kExpenseStat,
                ),
              ),
            ],
          ),
          kDivider,
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.deepPurple[600],
                  Colors.cyan[400],
                ]),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Expenses',
                      style: kExpense,
                    ),
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
                  ),
                  Container(
                    child: TodayMonth(),
                  ),
                  Container(
                    child: Amount(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Color(0xFFF9F8F8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardButton(
                          buttonIcon: Icons.approval,
                          label: 'Top-up request',
                          buttonColor: Color(0x80FF716D)),
                      DashboardButton(
                          buttonIcon: Icons.mobile_friendly_outlined,
                          label: 'Reimbursement status',
                          buttonColor: Color(0x80A08AF3)),
                      DashboardButton(
                          buttonIcon: Icons.assignment_ind_outlined,
                          label: 'Report',
                          buttonColor: Color(0x80F169B1)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashboardButton(
                          buttonIcon: Icons.my_library_books_outlined,
                          label: 'News',
                          buttonColor: Color(0x8090DDD0)),
                      DashboardButton(
                          buttonIcon: Icons.history_outlined,
                          label: 'History',
                          buttonColor: Color(0x80FF8E61)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_right_alt_outlined,
                      size: 30.0,
                      color: Colors.black45,
                      ),
                      Text('Swipe right for Expense Statistics',style: kSwipe,)
                    ],
                    ),
                  LoginButton(label: 'Add Expense',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
