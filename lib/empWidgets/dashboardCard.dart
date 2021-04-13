import 'package:ReExA/empScreens/addExpense.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ReExA/empScreens/histroy.dart';
import 'package:ReExA/empScreens/news.dart';
import 'package:ReExA/empScreens/reimbursementStatus.dart';
import 'package:ReExA/empScreens/topUpRequest.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

//*********************************************Login Button*******************************************************************

class LoginButton extends StatelessWidget {
  final String label;
  final String route;
  //final Function onPress;
  const LoginButton({
    this.label,
    this.route,
  });

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

//*********************************************Expense Card*******************************************************************

class TodayMonth extends StatelessWidget {
  final String approved;
  final String pending;
  final String rejected;
  const TodayMonth({
   this.approved,this.pending,this.rejected
  }) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              approved,
              style: kToday,
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              pending,
              style: kToday,
            ),
            padding: EdgeInsets.all(15.0),
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              rejected,
              style: kToday,
            ),
            padding: EdgeInsets.all(15.0),
          ),
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
  bool circular = true;
  var countPending;
  var countRejected;
  var countApproved;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/transactionMade');

    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );

    final responseData = json.decode(response.body);

    countPending =
        responseData.where((c) => c['status'] == 'Pending').toList().length;
    countRejected =
        responseData.where((c) => c['status'] == 'Rejected').toList().length;
    countApproved =
        responseData.where((c) => c['status'] == 'Approved').toList().length;

    setState(() {
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return circular
        ? Center(child: CircularProgressIndicator())
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    countApproved.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countPending.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countRejected.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
            ],
          );
  }
}

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

//*********************************************Overview Page*******************************************************************

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
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Expenses',
                    style: kExpense,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  child: TodayMonth(approved: 'Approved',pending: 'Pending',rejected: 'Rejected',),
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
                      buttonIcon: Icons.request_page_rounded,
                      label: 'Reimbursement status',
                      buttonColor: Color(0xFFA08AF3),
                      route: ReimbursementStatus.id,
                    ),
                    DashboardButton(
                      buttonIcon: Icons.comment_rounded,
                      label: 'Report',
                      buttonColor: Color(0xFFF169B1),
                      route: null,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashboardButton(
                      buttonIcon: Icons.my_library_books_outlined,
                      label: 'News',
                      buttonColor: Color(0xFF00b894),
                      route: Newspage.id,
                    ),
                    DashboardButton(
                      buttonIcon: Icons.history_outlined,
                      label: 'History',
                      buttonColor: Color(0xFFFF8E61),
                      route: History.id,
                    ),
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
              LoginButton(
                label: 'Add Expense',
                route: AddExpense.id,
              )
            ],
          ),
        ),
      ],
    );
  }
}

//*********************************************ExpenseStatTab Page*******************************************************************

class ExpenseStatTab extends StatefulWidget {
  @override
  _ExpenseStatTabState createState() => _ExpenseStatTabState();
}

class _ExpenseStatTabState extends State<ExpenseStatTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(10.0),
          color: kPrimaryColor,
          child: Column(
            children: [
              Container(
                child: Text(
                  'Top-Ups',
                  style: kExpense,
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                child: TodayMonth(approved: 'Approved',pending: 'Pending',rejected: 'Rejected',),
              ),
              Container(
                child: ReimStat(),
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.all(10.0),
          color: kPrimaryColor,
          child: Column(
            children: [
              Container(
                child: Text(
                  'Reimbursements',
                  style: kExpense,
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                child: TodayMonth(approved: 'Approved',pending: 'Pending',rejected: 'Rejected',),
              ),
              Container(
                child: TopUpStat(),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

//********************************************************************ReimStat*****************************************************/
class ReimStat extends StatefulWidget {
  @override
  _ReimStatState createState() => _ReimStatState();
}

class _ReimStatState extends State<ReimStat> {
   bool circular = true;
  var countPending;
  var countRejected;
  var countApproved;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/topUpRequestSended');

    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );

    final responseData = json.decode(response.body);

    countPending =
        responseData.where((c) => c['status'] == 'Pending').toList().length;
    countRejected =
        responseData.where((c) => c['status'] == 'Rejected').toList().length;
    countApproved =
        responseData.where((c) => c['status'] == 'Approved').toList().length;

    setState(() {
      circular = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return circular
        ? Center(child: CircularProgressIndicator())
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    countApproved.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countPending.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countRejected.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
            ],
          );
  }
}


//********************************************************************ReimStat*****************************************************/


class TopUpStat extends StatefulWidget {
  @override
  _TopUpStatState createState() => _TopUpStatState();
}

class _TopUpStatState extends State<TopUpStat> {
  bool circular = true;
  var countPending;
  var countRejected;
  var countApproved;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final url = Uri.parse('https://reexapi.herokuapp.com/reimbursementTo');

    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );

    final responseData = json.decode(response.body);

    countPending =
        responseData.where((c) => c['status'] == 'Pending').toList().length;
    countRejected =
        responseData.where((c) => c['status'] == 'Rejected').toList().length;
    countApproved =
        responseData.where((c) => c['status'] == 'Done').toList().length;

    setState(() {
      circular = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return circular
        ? Center(child: CircularProgressIndicator())
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    countApproved.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countPending.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    countRejected.toString(),
                    style: kAmount,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
              ),
            ],
          );
  }
}