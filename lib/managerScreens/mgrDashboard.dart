import 'dart:ui';
import 'package:ReExA/managerScreens/reimburse.dart';
import 'package:ReExA/managerScreens/verifyTopUp.dart';

import 'verifyExpense.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/mgrWidgets/mgrDashCard.dart';
import 'package:ReExA/empScreens/news.dart';

class MgrDashboard extends StatefulWidget {
  static const String id = 'mgrDashboard';
  @override
  _MgrDashboardState createState() => _MgrDashboardState();
}

class _MgrDashboardState extends State<MgrDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: SideDrawer(),
      appBar: AppBar(
        actions: [
          SearchButton(),
          NotificationButton(),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: 150.0,
                child: Container(

                  decoration: BoxDecoration(
                    
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Color(0xFFF9F9F9),),
                  height: MediaQuery.of(context).size.height-220 ,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DashboardButton(
                              buttonIcon: Icons.mobile_screen_share_rounded,
                              label: 'Top-up',
                              buttonColor: Color(0xFF786fa6),
                              route: VerifyTopUp.id,
                            ),
                            DashboardButton(
                              buttonIcon: Icons.mobile_friendly_outlined,
                              label: 'Reimbursement',
                              buttonColor: Color(0xFFea8685),
                              route: Reimburse.id,
                            ),
                            
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DashboardButton(
                              buttonIcon: Icons.comment_rounded,
                              label: 'Report',
                              buttonColor: Color(0xFFF169B1),
                              //route: null,
                            ),
                            DashboardButton(
                              buttonIcon: Icons.my_library_books_outlined,
                              label: 'News',
                              buttonColor: Color(0xFF00b894),
                              route: Newspage.id,
                            ),
                            
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardButton(
                              buttonIcon: Icons.calculate_rounded,
                              label: 'Verify Expense',
                              buttonColor: Color(0xFF576574),
                              route: VerifyExpense.id,
                            ),
                          ],),
                        
                      ],
                    ),
                  ),
                ),
              
            ],
          ),
        ],
      ),
    );
  }
}
