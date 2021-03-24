import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/expenseCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddExpense extends StatefulWidget {
  static const String id = 'addExpense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  //var amount, receiptDate, descrip;

  //String errorText;
  //bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            color: Colors.black,
          )
        ],
        title: Text(
          'Add Expense',
          style: kappBarText,
        ),
      ),
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
                      child: DropDownManager(
                        hintText: 'Category',
                        hintList: categoryList,
                      ),
                    ),
                    Expanded(
                      child: DropDownManager(
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
                      onPressed: () async {
                        /*setState(
                            () {
                              showSpinner = true;
                            },
                          );*/
                        //unfocus();
                        print(amount);
                        print(descrip);
                        print(receiptDate);
                        print(managerId);
                        print(category);
                        print(payMethod);
                        //print(password);

                          var url = Uri.parse(
                              'https://reexapi.herokuapp.com/transaction');
                          final http.Response response = await http.post(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              // "Accept":'application/json',
                            },
                            body: jsonEncode(
                              <String, String>{
                                'amount': amount,
                                'description': descrip,
                                'managerId':managerId,
                                'category':category,
                                'receiptDate':receiptDate,
                                'payMethod':payMethod,
                              },
                            ),
                          );
                          //print(response.body);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          //var parse;
                          if (response.body.isNotEmpty) {
                            //parse = json.decode(response.body);
                            //print(parse["token"]);
                            String token = prefs.getString("token");
                            print(token);
                            print('ok');
                            //Navigator.pushNamed(context, EmpDashboard.id);
                          }

                        /* SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          String token = prefs.getString("token");
                          if (token.isNotEmpty) {
                            Navigator.pushNamed(context, EmpDashboard.id);
                          } 
                          else {
                            setState(
                              () {
                                validate = false;
                                errorText = 'Wrong input';
                                //showSpinner = false;
                              },
                            );
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
