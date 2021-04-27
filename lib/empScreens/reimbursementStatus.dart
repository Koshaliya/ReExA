import 'package:ReExA/empWidgets/reimbursementCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ReExA/data/users.dart';

class ReimbursementStatus extends StatefulWidget {
  static const String id = 'reimbursementStatus';

  @override
  _ReimbursementStatusState createState() => _ReimbursementStatusState();
}

class _ReimbursementStatusState extends State<ReimbursementStatus> {
  bool circular = true;
  //List managerData;
  var manager;
  var managerId;
  var managerName;
  var reimbursementStatus;
  var totalExpense;
  //int lengthOfManagerData;

  @override
  void initState() {
    super.initState();
    _getReimbursement();
    fetchManegerData();
    //print(managerId);

    setState(() {
      circular = false;
    });
  }

  IconData icon;
  Color iconColor;

  Future<void> _getReimbursement() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/reimbursementTo');
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
    //print('response:  ' + responseData.toString());
    return responseData;
  }

  

  // String getManagerName(dynamic id) {
  //   manager = managerData.firstWhere((manager) => manager['_id'] == id,
  //       orElse: () => print('No matching element.'));
  //   managerName = manager['name'];
  //   return manager['name'];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [SearchButton(), NotificationButton()],
        title: AppBarTitle(
          title: 'Reimbursement Status',
        ),
      ),
      drawer: SideDrawer(),
      body: FutureBuilder(
          initialData: [],
          future: _getReimbursement(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                managerId = snapshot.data[index]['reimbursementBy'];
                reimbursementStatus = snapshot.data[index]['status'];
                totalExpense = snapshot.data[index]['amount'];

                if (snapshot.data[index]['status'] == 'Pending') {
                  icon = CupertinoIcons.exclamationmark;
                  iconColor = Colors.yellow;
                } else if (snapshot.data[index]['status'] == 'Done') {
                  icon = Icons.done_rounded;

                  iconColor = Colors.green;
                } else {
                  icon = Icons.close_rounded;
                  iconColor = Colors.red;
                }
                // print(snapshot.data[index]['_id']);
                return ReimbursementManagerDetail(
                  managerId,
                  icon,
                  iconColor,
                  reimbursementStatus,
                  totalExpense,
                  managerData,
                );
              },
            );
          }),
    );
  }
}


