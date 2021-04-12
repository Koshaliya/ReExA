import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ReimbursementStatus extends StatefulWidget {
  static const String id = 'reimbursementStatus';

  @override
  _ReimbursementStatusState createState() => _ReimbursementStatusState();
}

class _ReimbursementStatusState extends State<ReimbursementStatus> {
  IconData icon;
  Color iconColor;

  Future<List<dynamic>> _getReimbursement() async {
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


    return responseData;
  }

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

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFFBFBFB),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.15),
                    ),
                  ),
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              snapshot.data[index]['reimbursementBy'],
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black87),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Total Expense',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.black87),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  snapshot.data[index]['amount'].toString(),
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Reimbursement Status',
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black87),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: iconColor,
                                ),
                                margin: EdgeInsets.all(5.0),
                                padding: EdgeInsets.all(3.0),
                                child: Icon(icon),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data[index]['status'],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}

/*
Future gettingTaskFromDb() async{
  logger.d('inside gettingTaskFromDb()');
  var url = Uri.parse('https://reexapi.herokuapp.com/cashreimbursements');

  var response = await http.get(url);
  if(response.statusCode == 201){
    print(response.body);

  }
  else{
    print('wrong');
  }
}*/
