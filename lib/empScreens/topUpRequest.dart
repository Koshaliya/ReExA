import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';
import 'package:ReExA/empWidgets/expenseCard.dart';
import 'package:ReExA/data/users.dart';


class TopUpRequest extends StatefulWidget {
  static const String id = 'topUpRequest';
  @override
  _TopUpRequestState createState() => _TopUpRequestState();
}

class _TopUpRequestState extends State<TopUpRequest> {
  final _formKey = GlobalKey<FormState>();
 
  @override
  void initState() {
    super.initState();
    fetchManegerData();
    
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
          title: 'Top Up Request',
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
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropDownManager(
                      hintText: 'Select Manager',
                      //hintList: manager,
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
                          buildTopUpPopUp(
                              context, managerIncharge, amount, description,managerData);
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
