import 'package:ReExA/empWidgets/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:ReExA/data/users.dart';

//************************************************************ inbox ***********************************************/

class InboxTab extends StatefulWidget {
  @override
  _InboxTabState createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  var message, title;
  var userName;

  @override
  void initState() {
    super.initState();
    _getInbox();
    fetchUserData();
  }

  Future _getInbox() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/reportReceiver');
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
    return Column(
      children: [
        Expanded(
          child: Container(
            child: FutureBuilder(
                initialData: [],
                future: _getInbox(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var userId = snapshot.data[index]['sender'];
                      for (var i = 0; i < userData.length; i++) {
                        if (userData[i]['_id'].toString() ==
                            userId.toString()) {
                          userName = (userData[i]['name'].toString());
                        } else {}
                      }
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFFBFBFB),
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                        ),
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data[index]['title'],
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      snapshot.data[index]['message'],
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sender:',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        userName,
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
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            newReport();
          },
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
        )
      ],
    );
  }

  //************************************************************ new report ***********************************************/

  Future newReport() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            content: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Container(
                  height: 450.0,
                  width: 450.0,
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        width: 400.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DropDownManager(
                              hintText: 'Select Manager',
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              maxLines: 2,
                              controller: TextEditingController(text: title),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Title can't be empty";

                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  title = value;
                                });
                              },
                              style: TextStyle(
                                  color: kSecondColor,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                border: kEnabledBorder,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1),
                                ),
                                enabledBorder: kEnabledBorder,
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              maxLines: 4,
                              controller: TextEditingController(text: message),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Message can't be empty";

                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  message = value;
                                });
                              },
                              style: TextStyle(
                                  color: kSecondColor,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                labelText: 'Message',
                                labelStyle: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                border: kEnabledBorder,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1),
                                ),
                                enabledBorder: kEnabledBorder,
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text(
                          'Send',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          final url =
                              Uri.parse('https://reexapi.herokuapp.com/report');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                           await http.post(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'receiver': managerIncharge,
                                'title': title,
                                'message': message,
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Report has been sent'),
                            ),
                          );
                          
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        });
  }
}

//************************************************************ sent ***********************************************/

class SentTab extends StatefulWidget {
  @override
  _SentTabState createState() => _SentTabState();
}

class _SentTabState extends State<SentTab> {
  var userName;

  @override
  void initState() {
    super.initState();
    fetchUserData();
        _getSent();

  }

  Future<List<dynamic>> _getSent() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/reportSender');
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
    return FutureBuilder(
        initialData: [],
        future: _getSent(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {

              var userId = snapshot.data[index]['receiver'];
              for (var i = 0; i < userData.length; i++) {
                if (userData[i]['_id'].toString() == userId.toString()) {
                  userName = (userData[i]['name'].toString());
                  
                } else {}
              }
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kPrimaryColor,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data[index]['title'],
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              snapshot.data[index]['message'],
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Receiver:',
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.white54),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                userName,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
