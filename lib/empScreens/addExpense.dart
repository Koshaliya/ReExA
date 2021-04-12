import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:ReExA/providers/users.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:http/http.dart' as http;

class AddExpense extends StatefulWidget {
  static const String id = 'addExpense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController(text: transactionDate);
  String dateDood;

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
          title: 'Add Expense',
        ),
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
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextField(
                          style: TextStyle(
                              color: kSecondColor, fontWeight: FontWeight.bold),
                          controller: dateCtl,
                          onChanged: (value) {
                            //print('valuesss : ' + value.toString());
                            transactionDate = value;

                            //print('transac :' + format(transactionDate).toString());
                          },
                          decoration: InputDecoration(
                            labelText: 'Receipt Date',
                            labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                            border: kEnabledBorder,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.5),
                            ),
                            enabledBorder: kEnabledBorder,
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                          onTap: () async {
                            DateTime date = DateTime(2019);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2022),
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData(
                                    textButtonTheme: new TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          primary: kSecondColor),
                                    ),
                                    colorScheme: ColorScheme.light(
                                      primary: kPrimaryColor,
                                      onPrimary: Colors.white,
                                      onSurface: kPrimaryColor,
                                    ),
                                  ),
                                  child: child,
                                );
                              },
                            );
                            dateCtl.text = DateFormat.yMMMd().format(date);
                          },
                        ),
                      ),
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
                      onPressed: () async {
                        
                      //   try {
                      //     print(amount);
                      //     print(description);
                      //     print(dateCtl.text);
                      //     print(managerIncharge);
                      //     print(category);
                      //     print(paymentMethod);

                      //     final url = Uri.parse(
                      //         'https://reexapi.herokuapp.com/transaction');
                      //     var sharedPreferencesX =
                      //         await SharedPreferences.getInstance();

                      //     var getToken = sharedPreferencesX.getString('token');
                      //     print(getToken);
                      //     //         final SharedPreferences preferences =
                      //     //     await SharedPreferences.getInstance();
                      //     // var imageBody = preferences.getString('pickedImage');

                      //     final http.Response response = await http.post(
                      //       url,
                      //       headers: <String, String>{
                      //         "Content-Type": 'application/json;charset=UTF-8',
                      //         "Accept": 'application/json',
                      //         "Authorization": 'Bearer $getToken'
                      //       },
                      //       body: jsonEncode(
                      //         <dynamic, String>{
                      //           'amount': amount,
                      //           'description': description,
                      //           'managerIncharge': managerIncharge,
                      //           'category': category,
                      //           'transationDate': transactionDate,
                      //           'paymentMethod': paymentMethod,
                      //           //'receiptImage':imageBody2,
                      //         },
                      //       ),
                      //     );
                      //     final responseData = json.decode(response.body);
                      //     _formKey.currentState.reset();
                      //     _formKey.currentState.dispose();
                      //     print(responseData);

                      //     //buildShowDialog(context);
                      //   } catch (error) {
                      //     print(error);
                      //     throw error;
                      //   }
                      //   //  String tokenGot;

                      //   /*var token = await getTokenFromSF();
                      //   getTokenFromSF().then((value) {
                      //     tokenGot=value;
                          
                      //   });

                      //  print(amount);
                      //   print(description);
                      //   print(transactionDate);
                      //   print(managerIncharge);
                      //   print(category);
                      //   print(paymentMethod);

                      //   print(token);

                      //   var url = Uri.parse(
                      //       'https://reexapi.herokuapp.com/transaction');
                      //   final response = await http.post(url,
                      //       headers: {
                      //         'Content-Type': 'application/json',
                      //         'Accept': 'application/json',
                      //         'Authorization': 'Bearer $token',
                      //       },
                      //       body: jsonEncode(
                      //         <dynamic, String>{
                      //           'amount': amount,
                      //           'description': description,
                      //           'managerIncharge': managerIncharge,
                      //           'category': category,
                      //           'transationDate': transactionDate,
                      //           'paymentMethod': paymentMethod,
                      //         },),
                      //       );
                      
                      //   print(response.body);
                      //   print(response.statusCode);
                      //   //SharedPreferences prefs =
                      //   //await SharedPreferences.getInstance();
                      //   //var parse;
                      //   if (response.statusCode == 201) {
                      //     //parse = json.decode(response.body);
                      //     //print(parse["token"]);

                      //     print('ok');
                      //     Navigator.pushNamed(context, EmpDashboard.id);
                      //   } else {
                      //     print('not ok');
                      //   }*/
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

// Future getTokenFromSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('token');
// }