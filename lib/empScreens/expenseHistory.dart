import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/historyCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:ReExA/data/users.dart';

class ExpenseHistory extends StatefulWidget {
  static const String id = 'ExpenseHistory';

  @override
  _ExpenseHistoryState createState() => _ExpenseHistoryState();
}

class _ExpenseHistoryState extends State<ExpenseHistory> {
  @override
  void initState() {
    super.initState();
    _getExpenseHistory();
    fetchManegerData();
  }

  Color color;

  Future<List<dynamic>> _getExpenseHistory() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/transactionMade');

    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
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
      backgroundColor: Color(0xFFFBFBFB),
      body: FutureBuilder(
          initialData: [],
          future: _getExpenseHistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.data[index]['status'] == 'Approved') {
                    color = Color(0xFF4CAF50);
                  } else if (snapshot.data[index]['status'] == 'Pending') {
                    color = Colors.yellow;
                  } else {
                    color = Colors.red;
                  }
                  var parsedDate =
                      DateTime.parse(snapshot.data[index]['transactionDate']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();
                  return GestureDetector(
                    onTap: () {
                      expenseHistoryShowDialog(
                          context,
                          snapshot.data[index]['status'],
                          snapshot.data[index]['managerIncharge'].toString(),
                          snapshot.data[index]['amount'].toString(),
                          snapshot.data[index]['paymentMethod'].toString(),
                          snapshot.data[index]['category'].toString(),
                          transDate,
                          snapshot.data[index]['description'].toString(),
                          managerData);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 40.0, top: 15.0, bottom: 15.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: color,
                            width: 10,
                          ),
                          left: BorderSide(
                            color: Color(0x40878383),
                            width: 1,
                          ),
                          top: BorderSide(
                            color: Color(0x40878383),
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Color(0x40878383),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index]['category'],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rs ${snapshot.data[index]['amount']}',
                              ),
                              Text(transDate),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
