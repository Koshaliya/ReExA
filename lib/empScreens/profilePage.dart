import 'package:ReExA/empWidgets/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                  top: 75.0,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height - 100.0,
                      width: MediaQuery.of(context).size.width)),
              Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/pro5.jpg'),
                      backgroundColor: kPrimaryColor,
                    ),
                      height: 200.0,
                      width: 200.0),
            ],
          )
        ],
      ),
    );
  }
}
