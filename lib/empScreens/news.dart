import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:intl/intl.dart';

class Newspage extends StatefulWidget {
  static const String id = 'newsPage';
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  bool circular = true;
  var currentuser;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  var username;
  Future<List<dynamic>> _getNews() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/news');
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

    var sharedPreferencesUserName = await SharedPreferences.getInstance();
    String s = sharedPreferencesUserName.getString('user');
    var currentuser = jsonDecode(s);
    username = currentuser['name'];

    final responseData = json.decode(response.body);
    setState(() {
      circular = false;
    });
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
          title: 'News',
        ),
      ),
      drawer: SideDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                circular
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                        'Hello, $username',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Latest exclusive news',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      wordSpacing: 5,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          FutureBuilder(
              initialData: [],
              future: _getNews(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // width: 200.0,
                          // height: 180.0,
                          padding: EdgeInsets.all(15.0),
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                snapshot.data[index]['news'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                DateFormat.yMMMd()
                                    .format(DateTime.parse(
                                        snapshot.data[index]['createdAt']))
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }
}

// Color(0xFFF7D794),

//  Color(0xFF64CDDB),

//  Color(0xFF596174),

//  Color(0xFF786FA6),
