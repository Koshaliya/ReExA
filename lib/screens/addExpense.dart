import 'dart:convert';
import 'package:ReExA/screens/empDashboard.dart';
import 'package:ReExA/screens/reimbursementScreen.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/expenseCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:ReExA/Example.dart';
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFFF1EFEF),
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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: kPrimaryColor,
                                                child: Icon(Icons
                                                    .receipt_long_outlined),
                                              ),
                                              Text('Add expense approval')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Authorizer Name',
                                                  style: kPopTitle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'T.K. Perera',
                                                  style: kPopTitleAns,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Colors.greenAccent),
                                            ),
                                            child: Text(
                                              "Confirm",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0),
                                            ),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });

                        //String tokenGot;
/*
                        var token = await getTokenFromSF();
                        /*getTokenFromSF().then((value) {
                          tokenGot=value;
                          
                        });*/

                       /* print(amount);
                        print(description);
                        print(transactionDate);
                        print(managerIncharge);
                        print(category);
                        print(paymentMethod);*/

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
                              },
                            )*/);
                      
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
