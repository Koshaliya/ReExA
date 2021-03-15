import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/InputBoxCard.dart';
import 'package:ReExA/Widgets/TodayMonthCard.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
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
      body: Column(
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
                    child: DropDownArrow(),
                  ),
                  Expanded(
                    child: InputField(label: 'Category'),
                  ),
                  Expanded(
                    child: InputField(label: 'Payment Method'),
                  ),
                  Expanded(
                    child: InputField(label: 'Amount'),
                  ),
                  Expanded(
                    child: InputField(label: 'Receipt Date'),
                  ),
                  Expanded(
                    child: InputField(label: 'Description'),
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
                  AttachButton(
                    label: 'Attach Receipt',
                  ),
                  SizedBox(
                    height:20.0
                  ),
                  LoginButton(
                    label: 'Submit',
                  )
                ],
              ))
        ],
      ),
    );
  }
}
