
import 'package:flutter/material.dart';
import '../empWidgets/constants.dart';



//*******************************************************History Container***********************************************************/
class HistoryContainer extends StatelessWidget {
  final String uber;
  final String rupees;

  const HistoryContainer({this.uber, this.rupees});

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
        children: [
          Text(uber),
          Text(rupees),
        ],
      ),
    );
  }
}

//*******************************************************History PopUp***********************************************************/

//************************************************PopUp Screen************************************************************/

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFF1EFEF),
        insetPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        content: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.greenAccent[400],
                        child: Text(
                          'Add expense approval',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Manager Name',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'M001',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Employee Name',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'E001',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Rs 52000',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Requested Date',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '02/04/2020',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Client meeting',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
