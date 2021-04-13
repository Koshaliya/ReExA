import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//*********************************************Expense Stat Page*******************************************************************

class ExpenseStat extends StatefulWidget {
  @override
  _ExpenseStatState createState() => _ExpenseStatState();
}

class _ExpenseStatState extends State<ExpenseStat> {
  bool circular = true;

  List<charts.Series<Expense, dynamic>> _seriesPieData = [];

  int countPending;
  int countRejected;
  int countApproved;

  void fetchData() async {
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

    countPending = await responseData
        .where((c) => c['status'] == 'Pending')
        .toList()
        .length;
    countRejected = await responseData
        .where((c) => c['status'] == 'Rejected')
        .toList()
        .length;
    countApproved = await responseData
        .where((c) => c['status'] == 'Approved')
        .toList()
        .length;
    print(countPending);

    var pieData;
    setState(() {
       pieData = [
        Expense(status: 'Pending', count: countPending),
        Expense(status: 'Rejected', count: countRejected),
        Expense(status: 'Approved', count: countApproved),
      ];
    });

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Expense expense, _) => expense.status,
        measureFn: (Expense expense, _) => expense.count,
        id: 'Expenses',
        labelAccessorFn: (Expense row, _) => '${row.status}',
      ),
    );
  }

  // _generateData() {
    
  // }

  @override
  void initState() {
    super.initState();
    fetchData();
    // _generateData();
    setState(() {
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return circular
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400.0,
                    child: Center(
                      child: Column(children: [
                        Text('Expenses approved by the managers'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                            child: Container(
                                child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: EdgeInsets.only(
                                right: 4.0,
                                bottom: 4.0,
                              ),
                              entryTextStyle: charts.TextStyleSpec(
                                fontSize: 12,
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                              ),
                            ),
                          ],
                          defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator(
                                    labelPosition:
                                        charts.ArcLabelPosition.inside)
                              ]),
                        )))
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class Expense {
  final String status;
  final int count;

  //constructor
  Expense({this.status, this.count});
}
