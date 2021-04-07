import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TopUpRequest extends StatefulWidget {
  static const String id = 'topUpRequest';
  @override
  _TopUpRequestState createState() => _TopUpRequestState();
}

class _TopUpRequestState extends State<TopUpRequest> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,

          actions: [
            SearchButton(),
            NotificationButton()
          ],
          title: AppBarTitle(title: 'Top Up Request',),
      ),
      drawer: SideDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropDownManager(
                      hintText: 'Select Manager',
                      hintList: managerList,
                    ),
                    AmountField(
                      label: 'Amout',
                    ),
                    DescriptionField(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 250.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          print(amount);
                          print(managerIncharge);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/topUpRequest');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          print(getToken);
                          final http.Response response = await http.post(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'amount': amount,
                                'requestTo': managerIncharge,
                                'description':description
                                
                              },
                            ),
                          );
                          final responseData = json.decode(response.body);
                          print(responseData);
                          //buildShowDialog(context);
                        } catch (error) {
                          print(error);
                          throw error;
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kSecondColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
