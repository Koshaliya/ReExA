import 'package:flutter/material.dart';
import 'package:ReExA/empScreens/profilePage.dart';

const kPrimaryColor =Color(0xFF2C5EA8);
const kSecondColor =Color(0xFF42C9F3);

const kReEx = TextStyle(
  fontFamily: 'OpenSans',
  color: Color(0xFF243656),
  fontSize: 40.0,
  
);

const kappBarText = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
);


const kButton = TextStyle(
  fontSize: 14.0,
  color: Colors.white,
  
);

const kEnabledBorder =OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
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
      //color: Colors.black,
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
      //color: Colors.black,
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
