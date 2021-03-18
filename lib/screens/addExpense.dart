import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';
import 'package:ReExA/Widgets/expenseCard.dart';
import 'package:ReExA/Widgets/dashboardCard.dart';



class AddExpense extends StatefulWidget {
  static const String id = 'addExpense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
                    child: DropDownArrow(
                      hintText: 'Select Manager',
                      hintList: managerList,
                    ),
                  ),
                  Expanded(
                    child: DropDownArrow(
                      hintText: 'Category',
                      hintList: categoryList,
                    ),
                  ),
                  Expanded(
                    child: DropDownArrow(
                      hintText: 'Payment Method',
                      hintList: paymentList,
                    ),
                  ),
                  Expanded(
                    child: AmountField(label: 'Amout',)
                  ),
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
