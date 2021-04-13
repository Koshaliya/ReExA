import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/mgrWidgets/verifyExpenseCard.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyExpense extends StatefulWidget {
  static const String id = 'verifyExpense';

  @override
  _VerifyExpenseState createState() => _VerifyExpenseState();
}

class _VerifyExpenseState extends State<VerifyExpense> {

  Future<List<dynamic>> _getVerifyExpense() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/transactionIncharge');
    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
    //print(getToken);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );

    final responseData = json.decode(response.body);

    return responseData;
  }

  ScaffoldState scaffold;
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [SearchButton(), NotificationButton()],
          title: AppBarTitle(
            title: 'Verify Expense',
          ),
          bottom: TabBar(
            labelColor: Color(0xFF344955),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            indicatorColor: kSecondColor,
            
            tabs: [
              Tab(
                text: 'Pending',
              ),
              Tab(text: 'Approved'),
              Tab(text: 'Rejected'),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: Builder(
          builder: (BuildContext buildContext) {
            scaffold = Scaffold.of(buildContext);
            return TabBarView(
              children: [
                VerifyExpensePending(getdetail: _getVerifyExpense,),
                VerifyExpenseApproved(getdetail: _getVerifyExpense,),
                VerifyExpenseRejected(getdetail: _getVerifyExpense,),
              ],
            );
          },
        ),
      ),
    );
  }
}
