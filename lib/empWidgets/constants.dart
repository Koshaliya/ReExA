import 'package:ReExA/empScreens/empDashboard.dart';
import 'package:ReExA/empScreens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:ReExA/empScreens/profilePage.dart';
import 'package:ReExA/providers/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ReExA/managerScreens/mgrDashboard.dart';
import 'dart:convert';

const kPrimaryColor = Color(0xFF2C5EA8);
const kSecondColor = Color(0xFF42C9F3);

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

const kExpense = TextStyle(
  fontSize: 16.0,
  color: kSecondColor,
  fontWeight: FontWeight.bold,
);

const kToday =
    TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.bold);

const kAmount = TextStyle(
  fontSize: 16.0,
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

const kEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor, width: 1),
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

const kPopTitle = TextStyle(
  color: Color(0xFF9A9595),
  letterSpacing: 0.5,
  fontSize: 12.0,
);

const kPopTitleAns = TextStyle(
  color: Color(0xFF1B6DE8),
  letterSpacing: 0.5,
  fontSize: 13.0,
);

//*********************************************App Bar *******************************************************************

class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kappBarText,
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(context: context, delegate: DataSearch());
      },
    );
  }
}

//*********************************************Side Drawer*******************************************************************

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool circular = true;
  var currentuser;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var sharedPreferencesX = await SharedPreferences.getInstance();
    String s = sharedPreferencesX.getString('user');
    currentuser = jsonDecode(s);

    setState(() {
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return circular
        ? Center(child: CircularProgressIndicator())
        : Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  color: kPrimaryColor,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: currentuser['gender'] =='female' ? AssetImage('images/female.jpg')
                             :AssetImage('images/male.png'),
                            backgroundColor: kPrimaryColor,
                          ),
                        ),
                        Text(
                          currentuser['name'].toString(),
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          currentuser['userId'].toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                        Text(
                          currentuser['role'].toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white54),
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ProfilePage.id);
                    }),
                ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () async {
                      var sharedPreferencesRole =
                          await SharedPreferences.getInstance();
                      var getUserRole =
                          sharedPreferencesRole.getString('userRole');
                      print(getUserRole);

                      if (getUserRole == 'employee') {
                        Navigator.of(context).pushNamed(EmpDashboard.id);
                      } else if (getUserRole == 'manager') {
                        Navigator.of(context).pushNamed(MgrDashboard.id);
                      } else {
                        print('error');
                      }
                    }),
                ListTile(
                  leading: Icon(Icons.arrow_back),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Auth().logOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                    //Navigator.pushNamed(context, LoginPage.id);
                  },
                ),
              ],
            ),
          );
  }
}

//*********************************************Search*******************************************************************
final normalEmp = [
  "184081D",
  "184082D",
  "184083D",
  "184084D",
  "184085D",
  "184130E",
  "184184V",
];
final recentEmp = [
  "184082D",
  "184130E",
  "184184V",
];

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentEmp
        : normalEmp.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.pushNamed(context, ProfilePage.id);
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
