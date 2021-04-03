import 'package:ReExA/empScreens/expenseHistory.dart';
import 'package:flutter/material.dart';

class HeadingButton extends StatelessWidget {
  final String label;
  //final String route;
  const HeadingButton({this.label,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ExpenseHistory()),
  );
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.symmetric(horizontal:10.0,),
        color: Color(0xFFFBFBFB),
        child: Text(
          label,
          style:
              TextStyle(color: Color(0xFF797777), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 15.0, right: 40.0, top: 15.0, bottom: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.green,
            width: 10,
          ),
          left: BorderSide(
            color: Color(0x40878383),
            width: 1,
          ),
          top: BorderSide(
            color: Color(0x40878383),
            width: 1,
          ),
          bottom: BorderSide(
            color: Color(0x40878383),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Uber'), Text('Rs 850')],
      ),
    );
  }
}

