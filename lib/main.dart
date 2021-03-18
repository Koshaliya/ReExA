
import 'package:ReExA/screens/forgotPass.dart';
import 'package:ReExA/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'screens/loginPage.dart';
import 'package:ReExA/screens/empDashboard.dart';
import 'package:ReExA/screens/addExpense.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
      scaffoldBackgroundColor: Colors.white,
       
        
    ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        ForgotPassword.id:(context) => ForgotPassword(),
        EmpDashboard.id: (context) => EmpDashboard(),
        AddExpense.id: (context) => AddExpense(),
        
      },
    );
  }
}



