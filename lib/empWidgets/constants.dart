import 'package:flutter/material.dart';
import 'package:ReExA/empScreens/profilePage.dart';

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
  const AppBarTitle({ this.title });

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
      color: Colors.black,
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
      onPressed: () {},
      color: Colors.black,
    );
  }
}

//*********************************************Side Drawer*******************************************************************

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

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
                  backgroundImage: AssetImage('images/pro5.jpg'),
                  backgroundColor: kPrimaryColor,
                ),
                  ),
                  Text(
                    'Koshi',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    '184163G',
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
            onTap: (){
              Navigator.pushNamed(context, ProfilePage.id);
              }
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
