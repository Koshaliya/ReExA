import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:ReExA/data/users.dart';

class VerifyExpenseApproved extends StatefulWidget {
  final Function getdetail;
  VerifyExpenseApproved({this.getdetail});

  @override
  _VerifyExpenseApprovedState createState() => _VerifyExpenseApprovedState();
}

class _VerifyExpenseApprovedState extends State<VerifyExpenseApproved> {
 var employeeName, employeeId;
  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: kPrimaryColor);

    return Theme(
        data: theme,
        child: FutureBuilder(
            initialData: [],
            future: widget.getdetail(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  employeeId = snapshot.data[index]['transactionBy'];
                for (var i = 0; i < employeeData.length; i++) {
                  if (employeeData[i]['_id'].toString() ==
                      employeeId.toString()) {
                    employeeName = (employeeData[i]['name'].toString());
                  } else {}
                }
                  var parsedDate =
                      DateTime.parse(snapshot.data[index]['transactionDate']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();

                  return (snapshot.data[index]['status'] == 'Approved')
                      ? ExpansionTile(
                    tilePadding:
                        EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
                    title: Text(
                      employeeName.toString(),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Category',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['category'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['amount'].toString(),
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['paymentMethod'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Receipt Date',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      transDate,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.only(left: 10.0),
                    children: [
                      Divider(),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data[index]['description'],
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  )
                : SizedBox();
                },
              );
            }));
  }
}


//********************************************************************************* */
class VerifyExpensePending extends StatefulWidget {
  final Function getdetail;
  VerifyExpensePending({this.getdetail});
  @override
  _VerifyExpensePendingState createState() => _VerifyExpensePendingState();
}

class _VerifyExpensePendingState extends State<VerifyExpensePending> {
  var employeeName, employeeId;
  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: kPrimaryColor);
    return Theme(
        data: theme,
        child: FutureBuilder(
            initialData: [],
            future: widget.getdetail(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  employeeId = snapshot.data[index]['transactionBy'];
                for (var i = 0; i < employeeData.length; i++) {
                  if (employeeData[i]['_id'].toString() ==
                      employeeId.toString()) {
                    employeeName = (employeeData[i]['name'].toString());
                  } else {}
                }
                  var parsedDate =
                      DateTime.parse(snapshot.data[index]['transactionDate']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();
                  
                  return (snapshot.data[index]['status'] == 'Pending')
                      ? ExpansionTile(
                    tilePadding:
                        EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
                    title: Text(
                      employeeName.toString(),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Category',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['category'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['amount'].toString(),
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['paymentMethod'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Receipt Date',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      transDate,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.only(left: 10.0),
                    children: [
                      Divider(),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data[index]['description'],
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
                            child: ElevatedButton(
                              child: Text('Accept'),
                              onPressed: () async{
                                final url = Uri.parse(
                                'https://reexapi.herokuapp.com/transaction/${snapshot.data[index]['_id']}');
                            var sharedPreferencesX =
                                await SharedPreferences.getInstance();

                            var getToken =
                                sharedPreferencesX.getString('token');
                            await http.patch(
                              url,
                              headers: <String, String>{
                                "Content-Type":
                                    'application/json;charset=UTF-8',
                                "Accept": 'application/json',
                                "Authorization": 'Bearer $getToken'
                              },
                              body: jsonEncode(
                                <dynamic, String>{
                                  'status': 'Approved',
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('Expense has been approved'),
                              ),
                            );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
                            child: ElevatedButton(
                              child: Text('Reject'),
                              onPressed: () async{
                                final url = Uri.parse(
                                'https://reexapi.herokuapp.com/transaction/${snapshot.data[index]['_id']}');
                            var sharedPreferencesX =
                                await SharedPreferences.getInstance();

                            var getToken =
                                sharedPreferencesX.getString('token');
                            await http.patch(
                              url,
                              headers: <String, String>{
                                "Content-Type":
                                    'application/json;charset=UTF-8',
                                "Accept": 'application/json',
                                "Authorization": 'Bearer $getToken'
                              },
                              body: jsonEncode(
                                <dynamic, String>{
                                  'status': 'Rejected',
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('Expense has been rejected'),
                              ),
                            );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                Colors.redAccent,
                              )),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
                            child: ElevatedButton(
                              child: Text('Pending'),
                              onPressed: () async{
                                final url = Uri.parse(
                                'https://reexapi.herokuapp.com/transaction/${snapshot.data[index]['_id']}');
                            var sharedPreferencesX =
                                await SharedPreferences.getInstance();

                            var getToken =
                                sharedPreferencesX.getString('token');
                             await http.patch(
                              url,
                              headers: <String, String>{
                                "Content-Type":
                                    'application/json;charset=UTF-8',
                                "Accept": 'application/json',
                                "Authorization": 'Bearer $getToken'
                              },
                              body: jsonEncode(
                                <dynamic, String>{
                                  'status': 'Pending',
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('Expense has been on pending'),
                              ),
                            );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.deepOrangeAccent,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : SizedBox();
                },
              );
            }));
  }
}

//************************************************************************************************** */


class VerifyExpenseRejected extends StatefulWidget {
  final Function getdetail;
  VerifyExpenseRejected({this.getdetail});

  @override
  _VerifyExpenseRejectedState createState() => _VerifyExpenseRejectedState();
}

class _VerifyExpenseRejectedState extends State<VerifyExpenseRejected> {
var employeeName, employeeId;
  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: kPrimaryColor);

    return Theme(
        data: theme,
        child: FutureBuilder(
            initialData: [],
            future: widget.getdetail(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  employeeId = snapshot.data[index]['transactionBy'];
                for (var i = 0; i < employeeData.length; i++) {
                  if (employeeData[i]['_id'].toString() ==
                      employeeId.toString()) {
                    employeeName = (employeeData[i]['name'].toString());
                  } else {}
                }
                  var parsedDate =
                      DateTime.parse(snapshot.data[index]['transactionDate']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();

                  return (snapshot.data[index]['status'] == 'Rejected')
                      ? ExpansionTile(
                    tilePadding:
                        EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
                    title: Text(
                      employeeName,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Category',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['category'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['amount'].toString(),
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index]['paymentMethod'],
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Receipt Date',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      transDate,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.only(left: 10.0),
                    children: [
                      Divider(),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data[index]['description'],
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  )
                : SizedBox();
                },
              );
            }));
  }
}