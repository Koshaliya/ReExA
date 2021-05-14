import 'package:ReExA/empWidgets/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  static const String id = 'profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool circular = true;
  var currentuser;
  //var bankdetail;
  var nameEdit, dateOfBirth, email, password, mobileNumber, gender;
//   var accBranch, accNumber, accBank;
// final myList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    setState(() {
      circular = false;
    });
  }

  // getBankDetail() async {
  //   final url = Uri.parse('https://reexapi.herokuapp.com/bankDetail');
  //   var sharedPreferencesX = await SharedPreferences.getInstance();
  //   var getToken = sharedPreferencesX.getString('token');

  //   final http.Response response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       "Content-Type": 'application/json;charset=UTF-8',
  //       "Accept": 'application/json',
  //       "Authorization": 'Bearer $getToken'
  //     },
  //   );

  //   final responseData = json.decode(response.body);
   
  // // responseData.forEach((e) {    
  // //   myList.add({"bank": e['bank'], 'branch': e['branch'], 'accountNumber': e['accountNumber']});
    
  // // });
  // // return myList;
  //   // accBank = responseData['bank'];
  //   // print(accBank);
  //   // accNumber = responseData['accountNumber'];
  //   // accBranch = responseData['branch'];
    
  // }

  void fetchData() async {
    var sharedPreferencesX = await SharedPreferences.getInstance();
    String s = sharedPreferencesX.getString('user');
    currentuser = jsonDecode(s);
  }

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
      body: circular
          ? Center(child: CircularProgressIndicator())
          :  ListView(
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
                          left: (MediaQuery.of(context).size.width / 2) - 60,
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: currentuser['gender'] =='female' ? AssetImage('images/female.jpg')
                             :AssetImage('images/male.png'),
                            backgroundColor: kPrimaryColor,
                          ),
                          height: 150.0,
                          width: 150.0),
                      Positioned(
                        top: 180.0,
                        left: 25.0,
                        right: 25.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Name',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text('Email',
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Employee Id',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Phone',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Date of Birth',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Gender',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              currentuser['name'].toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              currentuser['email'].toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              currentuser['userId'].toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              currentuser['mobileNumber']
                                                  .toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              DateFormat.yMMMd()
                                                  .format(DateTime.parse(
                                                      currentuser['dateOfBirth']))
                                                  .toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              currentuser['gender'].toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            onPressed: () {
                                              nameEditPop();
                                            },
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            onPressed: () {
                                              emailEditPop();
                                            },
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            color: Colors.white,
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            onPressed: () {
                                              mobileEditPop();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            onPressed: () {
                                              dOBEditPop();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit_rounded),
                                            iconSize: 18,
                                            onPressed: () {
                                              genderEditPop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            // Container(
                            //   padding: EdgeInsets.only(right: 40.0),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text(
                            //           'Account Details',
                            //           style: TextStyle(
                            //               fontSize: 20.0,
                            //               color: Colors.black,
                            //               fontWeight: FontWeight.w300),
                            //         ),
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Column(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceEvenly,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: EdgeInsets.all(10.0),
                            //                 child: Icon(
                            //                   Icons.account_balance_rounded,
                            //                   color: kPrimaryColor,
                            //                   size: 28,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //           Column(
                            //             // mainAxisAlignment:
                            //             //     MainAxisAlignment.spaceEvenly,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: EdgeInsets.only(right: 10.0),
                            //                 child: Text(
                            //                    'bank',
                            //                   style: TextStyle(fontSize: 16),
                            //                 ),
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.only(right: 10.0),
                            //                 child: Text(
                            //                   'accBank',
                            //                   style: TextStyle(fontSize: 16),
                            //                 ),
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.only(right: 10.0),
                            //                 child: Text(
                            //                   'accBranch',
                            //                   style: TextStyle(fontSize: 16),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
              
    );
  }

//************************************************Edit Name PopUp Screen************************************************************/
  Future nameEditPop() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(children: [
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: TextEditingController(text: nameEdit),
                        validator: (value) {
                          if (value.isEmpty) return "Name can't be empty";

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            nameEdit = value;
                          });
                        },
                        style: TextStyle(
                            color: kSecondColor, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          border: kEnabledBorder,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                          ),
                          enabledBorder: kEnabledBorder,
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          print(nameEdit);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/users/me');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          http.patch(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'name': nameEdit,
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Name has been updated'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }

//************************************************Edit DOB PopUp Screen************************************************************/

  Future dOBEditPop() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(children: [
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: TextEditingController(text: dateOfBirth),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Date Of Birth can't be empty";

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            dateOfBirth = value;
                          });
                        },
                        style: TextStyle(
                            color: kSecondColor, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                          labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          border: kEnabledBorder,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                          ),
                          enabledBorder: kEnabledBorder,
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          print(dateOfBirth);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/users/me');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          http.patch(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'dateOfBirth': dateOfBirth,
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Date Of Birth has been updated'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }

  //************************************************Edit email PopUp Screen************************************************************/

  Future emailEditPop() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(children: [
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: TextEditingController(text: email),
                        validator: (value) {
                          if (value.isEmpty) return "Email can't be empty";

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        style: TextStyle(
                            color: kSecondColor, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          border: kEnabledBorder,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                          ),
                          enabledBorder: kEnabledBorder,
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          print(email);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/users/me');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          http.patch(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'email': email,
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Email has been updated'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }

  //************************************************Edit password PopUp Screen************************************************************/

  // Future passwordEditPop() {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           backgroundColor: Color(0xFFF1EFEF),
  //           insetPadding:
  //               EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  //           content: Stack(
  //             clipBehavior: Clip.none,
  //             children: <Widget>[
  //               Positioned(
  //                 right: -40.0,
  //                 top: -40.0,
  //                 child: InkResponse(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: CircleAvatar(
  //                     child: Icon(Icons.close),
  //                     backgroundColor: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 width: 300.0,
  //                 height: 200.0,
  //                 child: Column(children: [
  //                   Container(
  //                     width: 300.0,
  //                     child: TextFormField(
  //                       obscureText: true,
  //                       controller: TextEditingController(text: password),
  //                       validator: (value) {
  //                         if (value.isEmpty) return "Password can't be empty";

  //                         return null;
  //                       },
  //                       onChanged: (value) {
  //                         setState(() {
  //                           password = value;
  //                         });
  //                       },
  //                       style: TextStyle(
  //                           color: kSecondColor, fontWeight: FontWeight.bold),
  //                       decoration: InputDecoration(
  //                         labelText: 'Password',
  //                         labelStyle: TextStyle(
  //                             color: Colors.grey[700],
  //                             fontSize: 14.0,
  //                             fontWeight: FontWeight.bold),
  //                         border: kEnabledBorder,
  //                         focusedBorder: OutlineInputBorder(
  //                           borderSide:
  //                               BorderSide(color: kPrimaryColor, width: 1),
  //                         ),
  //                         enabledBorder: kEnabledBorder,
  //                         contentPadding: EdgeInsets.all(15.0),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 20.0,
  //                   ),
  //                   Container(
  //                     width: 100.0,
  //                     child: ElevatedButton(
  //                       child: Text(
  //                         'Update',
  //                         style: TextStyle(fontSize: 16),
  //                       ),
  //                       onPressed: () async {
  //                         print(password);
  //                         // final url =
  //                         //     Uri.parse('https://reexapi.herokuapp.com/users/me');
  //                         // var sharedPreferencesX =
  //                         //     await SharedPreferences.getInstance();

  //                         // var getToken = sharedPreferencesX.getString('token');
  //                         // http.patch(
  //                         //   url,
  //                         //   headers: <String, String>{
  //                         //     "Content-Type": 'application/json;charset=UTF-8',
  //                         //     "Accept": 'application/json',
  //                         //     "Authorization": 'Bearer $getToken'
  //                         //   },
  //                         //   body: jsonEncode(
  //                         //     <dynamic, String>{
  //                         //       'name': nameEdit,
  //                         //     },
  //                         //   ),
  //                         // );

  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                           SnackBar(
  //                             content: const Text('Password has been updated'),
  //                           ),
  //                         );
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         primary: kPrimaryColor,
  //                         elevation: 5,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(15.0),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ]),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  //************************************************Edit Gender PopUp Screen************************************************************/

  Future genderEditPop() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(children: [
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        obscureText: true,
                        controller: TextEditingController(text: gender),
                        validator: (value) {
                          if (value.isEmpty) return "Gender can't be empty";

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        style: TextStyle(
                            color: kSecondColor, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          border: kEnabledBorder,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                          ),
                          enabledBorder: kEnabledBorder,
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          print(gender);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/users/me');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          http.patch(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'gender': gender,
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Gender has been updated'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }

  //************************************************Edit mobile PopUp Screen************************************************************/

  Future mobileEditPop() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF1EFEF),
            insetPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                Container(
                  width: 300.0,
                  height: 200.0,
                  child: Column(children: [
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: TextEditingController(text: mobileNumber),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Mobile Number can't be empty";

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            mobileNumber = value;
                          });
                        },
                        style: TextStyle(
                            color: kSecondColor, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          border: kEnabledBorder,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                          ),
                          enabledBorder: kEnabledBorder,
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          print(mobileNumber);
                          final url = Uri.parse(
                              'https://reexapi.herokuapp.com/users/me');
                          var sharedPreferencesX =
                              await SharedPreferences.getInstance();

                          var getToken = sharedPreferencesX.getString('token');
                          http.patch(
                            url,
                            headers: <String, String>{
                              "Content-Type": 'application/json;charset=UTF-8',
                              "Accept": 'application/json',
                              "Authorization": 'Bearer $getToken'
                            },
                            body: jsonEncode(
                              <dynamic, String>{
                                'mobileNumber': mobileNumber,
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Mobile Number has been updated'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }
}
