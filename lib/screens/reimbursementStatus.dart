import 'package:flutter/material.dart';
import 'package:ReExA/Widgets/constants.dart';

import 'package:http/http.dart' as http;

class ReimbursementStatus extends StatefulWidget {
    static const String id = 'reimbursementStatus';
 
  @override
  _ReimbursementStatusState createState() => _ReimbursementStatusState();
}

class _ReimbursementStatusState extends State<ReimbursementStatus> {
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
          'Reimbursement Status',
          style: kappBarText,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFFFBFBFB),
                border: Border.all(
                  color: Colors.black.withOpacity(0.15),
                ),
              ),
              //color: Color(0xFFF00000),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.purple,
                        ),
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Kandy business trip',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text(
                          'Mr.J.R.Fernando',
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black87),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Total Expense',
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black87),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Rs 8470',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Reimbursement Status',
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black87),
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.yellow,
                          ),
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.bluetooth,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Pending',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
Future gettingTaskFromDb() async{
  logger.d('inside gettingTaskFromDb()');
  var url = Uri.parse('https://reexapi.herokuapp.com/cashreimbursements');

  var response = await http.get(url);
  if(response.statusCode == 201){
    print(response.body);

  }
  else{
    print('wrong');
  }
}*/