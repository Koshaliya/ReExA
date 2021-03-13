import 'package:flutter/material.dart';
import '../Widgets/constants.dart';
import 'package:ReExA/Widgets/TodayMonthCard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/playstore.png'),
            ),
          ),
          Center(
            child: Text('ReEx', style: kReEx),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('User ID', style: kloginText),
              width: 261.0,
              height: 56.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('Password', style: kloginText),
              width: 261.0,
              height: 56.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: LoginButton(
              label:'Login'
            ),
          ),
        ],
      )),
    );
  }
}

