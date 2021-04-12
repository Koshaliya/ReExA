import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class VerifyTopUpNew extends StatefulWidget {
  @override
  _VerifyTopUpNewState createState() => _VerifyTopUpNewState();
}

class _VerifyTopUpNewState extends State<VerifyTopUpNew> {
  Future<List<dynamic>> _getVerifyTopUp() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/topUpRequestReceived');
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
    final theme = Theme.of(context).copyWith(dividerColor: kPrimaryColor);
    return Theme(
      data: theme,
      child: FutureBuilder(
          initialData: [],
          future: _getVerifyTopUp(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                 var parsedDate =
                      DateTime.parse(snapshot.data[index]['createdAt']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();
                return ExpansionTile(
                  tilePadding:
                      EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
                  title: Text(
                    'R.L.Fernando',
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
                                      'Amount',
                                      style: TextStyle(color: Colors.grey),
                                    )),
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
                                    'Requested Date',
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
                              snapshot.data[index]['description'] == null ? 'no description' : snapshot.data[index]['description'],
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
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                            onPressed: () {},
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
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
