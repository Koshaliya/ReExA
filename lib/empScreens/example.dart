
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'example';
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ReimbursementStatusA>> _getUsers() async{
    final url = Uri.parse('https://reexapi.herokuapp.com/reimbursementTo');
    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
    print(getToken);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );
    final responseData = json.decode(response.body);
    print(responseData);
    
    List<ReimbursementStatusA> reimbursementStatusFull = [];

    for (var u in responseData) {
      ReimbursementStatusA reimbursementStatus = ReimbursementStatusA(
        u["amount"],
        u["status"],
        u["reimbursementBy"],
      );

      reimbursementStatusFull.add(reimbursementStatus);
    }

    print(reimbursementStatusFull.length);

    return reimbursementStatusFull;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    
                    title: Text(snapshot.data[index].amount),
                      subtitle: Text(snapshot.data[index].status),
                      onTap: (){

                        Navigator.push(context, 
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                        );}
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  final ReimbursementStatusA reimbursementStatus;

  DetailPage(this.reimbursementStatus);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(reimbursementStatus.status),
        )
    );
  }
}

class ReimbursementStatusA {
  final amount;
  final status;
  final reimbursementBy;

  ReimbursementStatusA(this.amount, this.status, this.reimbursementBy);
}
