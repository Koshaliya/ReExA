import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:ReExA/data/users.dart';


class AddExpense extends StatefulWidget {
  static const String id = 'addExpense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  void initState() {
    super.initState();
    fetchManegerData();
    
  }
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
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: DropDownManager(
                        hintText: 'Select Manager',
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
                        child: TextFormField(
                          style: TextStyle(
                              color: kSecondColor, fontWeight: FontWeight.bold),
                          controller: dateCtl,
                          onChanged: (value) {
                            setState(() {
                              dateCtl.text = value;
                            });
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
                            dateCtl.text = date.toIso8601String();
                                
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AttachImage(),
                  SizedBox(
                    height: 50.0,
                    width: 250.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        buildAddExpensePopUp(context,managerIncharge,category,paymentMethod,amount,dateCtl.text,description,receiptUrl,managerData);
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

