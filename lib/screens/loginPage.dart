import 'dart:convert';
//import 'package:ReExA/services/authService.dart';
import 'package:ReExA/screens/empDashboard.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/constants.dart';
import 'package:ReExA/Widgets/dashboardCard.dart';
import 'forgotPass.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:ReExA/services/user.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  // final _formKey = GlobalKey<FormState>();
  var userId, password;
/*
  var url=Uri.parse('http://localhost:3000/users/login');
  Future save() async{
    var res = await http.post(url,headers: <String,String> {
      "Context-Type":'application/json;charset=UTF-8' 
    },
    body: jsonEncode(<String,String> {
      'userID' :user.userID,
      'password': user.password,
    },),
    
    );
    print(res.body);
  }


  User user = User('', '');*/

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Form(
            //key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/playstore.png'),
                  ),
                ),
                TypewriterAnimatedTextKit(text: ['ReEx'], textStyle: kReEx),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 261.0,
                  height: 60.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      userId = value;
                    },
                    /*validator: (value) {
                      if (value.isEmpty) {
                        return 'Empty value not accepted';
                      } 
                        
                       else {
                        return null;
                      }
                    },*/
                    controller: TextEditingController(text: userId),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kSecondColor, fontWeight: FontWeight.bold),
                    //keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'User ID',
                      labelStyle: kloginText,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[800], width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                Container(
                  width: 261.0,
                  height: 60.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    /*validator: (value) {
                      if (value.isEmpty) {
                        return 'Empty value not accepted';
                      } else {
                        return null;
                      }
                    },*/
                    controller: TextEditingController(text: password),
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kSecondColor, fontWeight: FontWeight.bold),
                    //keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelStyle: kloginText,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[800], width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[400], width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, EmpDashboard.id);
                      print(userId);
                      print(password);

                      login(userId,password);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String token = prefs.getString("token");
                      if (token != null) {
                        Navigator.pushNamed(context, EmpDashboard.id);
                      }
                    },
                    child: Text(
                      'Login',
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
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                LoginButton(
                  label: 'Forgot Password?',
                  route: ForgotPassword.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

login(userId,password) async{
  var url= Uri.parse('http://127.0.0.1:3000/users/login');
  final http.Response response = await http.post(url,headers:<String,String> {
      "Content-Type":'application/json;charset=UTF-8' ,
    },
    body: jsonEncode(<String,String> {
      'userId' :userId,
      'password': password,
    },),
    
    );
    print(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parse =jsonDecode(response.body);
    print(parse["token"]);
    await prefs.setString("token", parse["token"]);

  }

