import 'package:flutter/material.dart';

class ReimbursementManagerDetail extends StatefulWidget {
  final managerId;
  final icon;
  final iconColor;
  final status;
  final totalExpense;
  final managerData;

  ReimbursementManagerDetail(this.managerId, this.icon, this.iconColor,
      this.status, this.totalExpense, this.managerData);

  @override
  _ReimbursementManagerDetailState createState() =>
      _ReimbursementManagerDetailState();
}

class _ReimbursementManagerDetailState
    extends State<ReimbursementManagerDetail> {
  var responseData;

  var manager;

  String managerName;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.managerData.length; i++) {
      if (widget.managerData[i]['_id'].toString() ==
          widget.managerId.toString()) {
        managerName = (widget.managerData[i]['name'].toString());
      } else {}
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFFBFBFB),
        border: Border.all(
          color: Colors.black.withOpacity(0.15),
        ),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Manager Name',
                      style: TextStyle(fontSize: 13.0, color: Colors.black87),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      managerName,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Total Expense',
                      style: TextStyle(fontSize: 13.0, color: Colors.black87),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      widget.totalExpense.toString(),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reimbursement Status',
                    style: TextStyle(fontSize: 13.0, color: Colors.black87),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: widget.iconColor,
                    ),
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(3.0),
                    child: Icon(widget.icon),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.status.toString(),
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
