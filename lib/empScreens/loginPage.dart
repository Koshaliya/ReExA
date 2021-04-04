import 'dart:convert';
import 'package:ReExA/empScreens/empDashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../empWidgets/constants.dart';
import 'package:ReExA/empWidgets/dashboardCard.dart';
import 'forgotPass.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ReExA/providers/auth.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  final _formKey = GlobalKey<FormState>();
  var userId, password;

  String errorText;
  bool validate = false;
  var currentFocus;
  bool showSpinner = false;

  Map<String,String> _authData={
    'userId':'',
    'password':''
  };

 Future<void> _onSubmit() async {
    if (!_formKey.currentState.validate()) {
      setState(
        () {
          validate = false;
          errorText = 'Wrong input';
          showSpinner = false;
        },
      );
    } 
      _formKey.currentState.save();
      try{
      await Provider.of<Auth>(context, listen: false).authenticate(_authData['userId'],_authData['password'] );
      Navigator.of(context).pushNamed(EmpDashboard.id);
      }
      catch (error)
    {
      
      print('Authentication Failed. Please try again later.');
    }
  }

  /* Future addTokenToSF() async {
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    print("PRANA" + token.toString());
  }*/

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

/*
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
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
                      onSaved: (value)
                          {
                            _authData['userId'] = value;
                          },
                      // onChanged: (value) {
                      //   userId = value;
                      // },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty value not accepted';
                        } 
                          
                         else {
                          return null;
                        }
                      },
                      controller: TextEditingController(text: userId),
                      textAlign: TextAlign.center,
                      //autofocus: true,
                      style: TextStyle(
                          color: kSecondColor, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'User ID',
                        labelStyle: kloginText,
                        errorText: validate ? null : errorText,
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
                      onSaved:  (value)
                          {
                            _authData['password'] = value;
                          },
                      // onChanged: (value) {
                      //   password = value;
                      // },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty value not accepted';
                        } else {
                          return null;
                        }
                      },
                      controller: TextEditingController(text: password),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kSecondColor, fontWeight: FontWeight.bold),
                      //keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelStyle: kloginText,
                        errorText: validate ? null : errorText,
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
                        setState(
                          () {
                            showSpinner = true;
                          },
                        );

                        _onSubmit();

                        unfocus();
                        print(userId);
                        print(password);
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
      ),
    );
  }
}
