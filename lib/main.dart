import 'package:ReExA/empScreens/forgotPass.dart';
import 'package:ReExA/empScreens/loginPage.dart';
import 'package:ReExA/empScreens/news.dart';
import 'package:ReExA/empScreens/profilePage.dart';
import 'package:ReExA/managerScreens/mgrDashboard.dart';
import 'package:ReExA/managerScreens/verifyExpense.dart';
import 'package:ReExA/managerScreens/verifyTopUp.dart';
import 'package:flutter/material.dart';
import 'empScreens/loginPage.dart';
import 'package:ReExA/empScreens/empDashboard.dart';
import 'package:ReExA/empScreens/addExpense.dart';
import 'package:ReExA/empScreens/reimbursementStatus.dart';
import 'package:ReExA/empScreens/histroy.dart';
import 'package:ReExA/empScreens/topUpRequest.dart';
import 'package:provider/provider.dart';
import 'package:ReExA/providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          ForgotPassword.id: (context) => ForgotPassword(),
          EmpDashboard.id: (context) => EmpDashboard(),
          AddExpense.id: (context) => AddExpense(),
          ReimbursementStatus.id: (context) => ReimbursementStatus(),
          History.id: (context) => History(),
          TopUpRequest.id: (context) => TopUpRequest(),
          ProfilePage.id: (context) => ProfilePage(),
          MgrDashboard.id: (context) => MgrDashboard(),
          Newspage.id: (context) => Newspage(),
          VerifyExpense.id: (context) => VerifyExpense(),
          VerifyTopUp.id: (context) => VerifyTopUp(),
        },
      ),
    );
  }
}
