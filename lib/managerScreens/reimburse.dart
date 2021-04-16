import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Reimburse extends StatefulWidget {
  static const String id = 'reimburse';
  @override
  _ReimburseState createState() => _ReimburseState();
}

class _ReimburseState extends State<Reimburse> {
  Future<List<dynamic>> _getReimburse() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/reimbursementBy');
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [SearchButton(), NotificationButton()],
        title: AppBarTitle(
          title: 'Reimbursement',
        ),
      ),
      drawer: SideDrawer(),
      body: FutureBuilder(
          initialData: [],
          future: _getReimburse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var parsedDate =
                      DateTime.parse(snapshot.data[index]['createdAt']);
                  var transDate =
                      DateFormat.yMMMd().format(parsedDate).toString();
                  
                  return (snapshot.data[index]['status'] == 'Pending')
                      ? Dismissible(
                          key: Key(index.toString()),
                          background: myHiddenContainer(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            final url = Uri.parse(
                                'https://reexapi.herokuapp.com/cashreimbursement/${snapshot.data[index]['_id']}');
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
                                  'status': 'Done',
                                },
                              ),
                            );

                            
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('Reimbursement has been done'),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFb2ebf2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'M K Fernando',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        transDate,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Rs ${snapshot.data[index]['amount']}'
                                          .toString(),
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(15.0),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFF9F9F9),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'M K Fernando',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      transDate,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rs ${snapshot.data[index]['amount']}'
                                        .toString(),
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                });
          }),
    );
  }

  Widget myHiddenContainer() {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kPrimaryColor,
      ),
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(Icons.mobile_friendly_outlined),
          onPressed: () {},
          color: Colors.white,
        ),
      ),
    );
  }
}
