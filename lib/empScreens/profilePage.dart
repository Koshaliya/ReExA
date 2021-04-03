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
          style: TextStyle(fontSize: 18.0, color: Colors.white),
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
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(right: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Personal Info',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                   fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Name',style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Email',style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Employee Id',style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Phone',style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500),),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Koshaliya'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('em001@email.com'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('E001'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('077123456'),
                                  ),
                                ],
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:20.0),
                    Container(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Account Details',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                   fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Icon(Icons.account_balance_rounded)
                                  ),
                                  
                                ],
                              ),
                              Column(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right:10.0),
                                    child: Text('4588 **** ****'),
                                  ),
                                  
                                ],
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
