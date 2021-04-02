import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class AddExpense extends StatefulWidget {
  static const String id = 'addExpense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        //leading: MenuButton(),
          actions: [
            SearchButton(),
            NotificationButton()
          ],
          title: AppBarTitle(title: 'Add Expense',),
      ),
      drawer: SideDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: DropDownManager(
                        hintText: 'Select Manager',
                        hintList: managerList,
                      ),
                    ),
                    Expanded(
                      child: DropDownCategory(
                        hintText: 'Category',
                        hintList: categoryList,
                      ),
                    ),
                    Expanded(
                      child: DropDownPayMethod(
                        hintText: 'Payment Method',
                        hintList: paymentList,
                      ),
                    ),
                    Expanded(
                        child: AmountField(
                      label: 'Amout',
                    )),
                    Expanded(
                      child: DateField(),
                    ),
                    Expanded(
                      child: DescriptionField(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AttachImage(),
                  SizedBox(
                    height: 50.0,
                    width: 250.0,
                    child: ElevatedButton(
                      onPressed: () async{
                        buildShowDialog(context);

                        /*String tokenGot;

                        var token = await getTokenFromSF();
                        getTokenFromSF().then((value) {
                          tokenGot=value;
                          
                        });

                       print(amount);
                        print(description);
                        print(transactionDate);
                        print(managerIncharge);
                        print(category);
                        print(paymentMethod);

                        print(token);

                        var url = Uri.parse(
                            'https://reexapi.herokuapp.com/users/me');
                        final response = await http.get(url,
                            headers: {
                              'Content-Type': 'application/json',
                              'Accept': 'application/json',
                              'Authorization': 'Bearer $token',
                            },
                            /*body: jsonEncode(
                              <dynamic, String>{
                                'amount': amount,
                                'description': description,
                                'managerIncharge': managerIncharge,
                                'category': category,
                                'transationDate': transactionDate,
                                'paymentMethod': paymentMethod,
                              },*/
                            );
                      
                        print(response.body);
                        print(response.statusCode);
                        //SharedPreferences prefs =
                        //await SharedPreferences.getInstance();
                        //var parse;
                        if (response.statusCode == 201) {
                          //parse = json.decode(response.body);
                          //print(parse["token"]);

                          print('ok');
                          Navigator.pushNamed(context, EmpDashboard.id);
                        } else {
                          print('not ok');
                        }*/
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

Future getTokenFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}