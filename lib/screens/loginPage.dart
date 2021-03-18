import 'package:ReExA/screens/empDashboard.dart';
import 'package:flutter/material.dart';
import '../Widgets/constants.dart';
import 'package:ReExA/Widgets/dashboardCard.dart';
import 'forgotPass.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/playstore.png'),
                ),
              ),
              Text('ReEx', style: kReEx),
              SizedBox(
                height: 30.0,
              ),
              Container(
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
              Container(
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
              SizedBox(
                height: 20.0,
              ),
              LoginButton(
                label: 'Login',
                route: EmpDashboard.id,
              ),
              SizedBox(
                height: 20.0,
              ),
              LoginButton(
                label: 'Forgot Password?',
                route: ForgotPassword.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
