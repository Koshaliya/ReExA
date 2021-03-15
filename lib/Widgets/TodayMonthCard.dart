import 'package:flutter/material.dart';
import 'constants.dart';


class LoginButton extends StatelessWidget {
  final String label;
  const LoginButton({this.label }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 250.0,
      child: RaisedButton(onPressed: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
             ),
          padding: EdgeInsets.all(15.0),
          color: Color(0xFFF9AA33),
          child: Text(label,
            style: TextStyle(fontSize: 18.0, color: Color(0xFF344955),fontWeight: FontWeight.bold),)
         ),
    );
  }
}

//Color(0xFF344955),
//Color(0xFFF9AA33),


class TodayMonth extends StatelessWidget {
  const TodayMonth({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          child: Container(
            child: Text(
              'Today',
              style: kToday,
            ),
            padding: EdgeInsets.only(top: 10.0, left: 70.0),
          ),
        ),
        Expanded(
          child: Container(
              child: Text(
                'This month',
                style: kToday,
              ),
              padding:
                  EdgeInsets.only(top: 10.0, left: 50.0)),
        ),
      ],
    );
  }
}

class Amount extends StatefulWidget {
  @override
  _AmountState createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          child: Container(
            child: Text(
              'Rs 350',
              style: kAmount,
            ),
            padding: EdgeInsets.only(top: 10.0, left: 70.0),
          ),
        ),
        Expanded(
          child: Container(
              child: Text(
                'Rs 5000',
                style: kAmount,
              ),
              padding:
                  EdgeInsets.only(top: 10.0, left: 50.0)),
        ),
      ],
    );
  }
}
class DashboardButton extends StatelessWidget {
  final IconData buttonIcon;
  final String label;
  final Color buttonColor;
  const DashboardButton({this.buttonIcon,this.label,this.buttonColor }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              buttonIcon,
              size: 40.0,
              color: Colors.white,
            ),
            Text(label,
                textAlign: TextAlign.center, style: kButton),
          ],
        ),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
