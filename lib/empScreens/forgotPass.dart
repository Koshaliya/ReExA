import 'package:ReExA/empScreens/empDashboard.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/dashboardCard.dart';


//*******************************************************JustExample****************************************************************
class ForgotPassword extends StatefulWidget {
  static const String id = 'forgotPass';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('images/playstore.png'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            LoginButton(
              label: 'Move Forward',
              route: EmpDashboard.id,
            ),
          ],
        ),
      ),
    );
  }
}
