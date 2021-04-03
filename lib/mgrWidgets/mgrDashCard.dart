import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';

//*********************************************DashBoard Buttons*******************************************************************

class DashboardButton extends StatelessWidget {
  final IconData buttonIcon;
  final String label;
  final Color buttonColor;
  final String route;

  const DashboardButton(
      {this.buttonIcon, this.label, this.buttonColor, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: 130.0,
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              buttonIcon,
              size: 50.0,
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


