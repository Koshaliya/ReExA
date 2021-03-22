import 'package:flutter/material.dart';

const kPrimaryColor =Color(0xFF2C5EA8);
const kSecondColor =Color(0xFF42C9F3);



const kReEx = TextStyle(
  fontFamily: 'OpenSans',
  color: Color(0xFF243656),
  fontSize: 40.0,
  
);

const kloginText = TextStyle(fontSize: 15.0, color: kPrimaryColor);
const kappBarText = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
);

/*const kOverviewText = TextStyle(
  fontSize: 13.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kExpenseStat = TextStyle(
  fontSize: 13.0,
  color: Color(0x95000000),
);

const kDivider = Divider(
  color: Color(0x95000000),
  thickness: 3,
  indent: 18,
  endIndent: 200,
);*/

const kExpense = TextStyle(
  fontSize: 16.0,
  color: kSecondColor,
  fontWeight: FontWeight.bold,
  
);

const kToday = TextStyle(
  fontSize: 13.0,
  color: Colors.white,
  fontWeight: FontWeight.bold
  
);

const kAmount = TextStyle(
  fontSize: 13.0,
  color: Colors.white,
  
);

const kButton = TextStyle(
  fontSize: 11.0,
  color: Colors.white,
  
);


const kSwipe = TextStyle(
  fontSize: 12.0,
  color: Colors.black87,
  
);

const kEnabledBorder =OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          );

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);