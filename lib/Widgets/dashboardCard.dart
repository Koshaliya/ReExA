import 'package:ReExA/screens/addExpense.dart';
import 'package:ReExA/screens/histroy.dart';
import 'package:ReExA/screens/reimbursementStatus.dart';
import 'package:ReExA/screens/topUpRequest.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final String route;
  //final Function onPress;
  const LoginButton({this.label,this.route,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.0,
        width: 250.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Text(
            label,
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
        ));
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
              padding: EdgeInsets.only(top: 10.0, left: 50.0)),
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
              padding: EdgeInsets.only(top: 10.0, left: 50.0)),
        ),
      ],
    );
  }
}

class DashboardButton extends StatelessWidget {
  final IconData buttonIcon;
  final String label;
  final Color buttonColor;
  final String route;

  const DashboardButton({this.buttonIcon, this.label, this.buttonColor,this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
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
            Text(label, textAlign: TextAlign.center, style: kButton),
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

class OverView extends StatelessWidget {
  const OverView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: main,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(10.0),
            color: kPrimaryColor,
            /*decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xFF344955),
Color(0xFFF9AA33),
      ]),
    ),*/
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Expenses',
                    style: kExpense,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
                ),
                Container(
                  child: TodayMonth(),
                ),
                Container(
                  child: Amount(),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 400.0,
            color: Color(0xFFF9F9F9),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardButton(
                        buttonIcon: Icons.approval,
                        label: 'Top-up request',
                        buttonColor: Color(0xFFFF716D),
                        route: TopUpRequest.id,
                        ),
                    DashboardButton(
                        buttonIcon: Icons.mobile_friendly_outlined,
                        label: 'Reimbursement status',
                        buttonColor: Color(0xFFA08AF3),
                        route: ReimbursementStatus.id,),
                    DashboardButton(
                        buttonIcon: Icons.assignment_ind_outlined,
                        label: 'Report',
                        buttonColor: Color(0xFFF169B1),
                        //route: null,
                        ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashboardButton(
                        buttonIcon: Icons.my_library_books_outlined,
                        label: 'News',
                        buttonColor: Color(0xFF90DDD0),
                        //route: null,
                        ),
                    DashboardButton(
                        buttonIcon: Icons.history_outlined,
                        label: 'History',
                        buttonColor: Color(0xFFFF8E61),
                        route: History.id,),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Swipe right for Expense Statistics',
                style: kSwipe,
              ),
              LoginButton(label: 'Add Expense',route: AddExpense.id,)
            ],
          ),
        ),
      ],
    );
  }
}
