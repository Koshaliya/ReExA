import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  // String _token;
  // String _userId;

  // bool get isAuth {
  //   return _token != null;
  // }

  // String get getUserId {
  //   return _userId;
  // }

  // String get token {
  //   if (_token != null) {
  //     return _token;
  //   }
  //   return null;
  // }

  Future<void> authenticate(String userId, String password) async {
    try {
      final url = Uri.parse('https://reexapi.herokuapp.com/users/login');
      final http.Response response = await http.post(
        url,
        body: jsonEncode(
          <String, String>{
            'userId': userId,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      // _userId = responseData['localId'];
      // _token = responseData['idToken'];
      // notifyListeners();
      // final prefs = await SharedPreferences.getInstance();
      // final authData = json.encode({
      //   'token': _token,
      //   'userId': _userId,
      // });
      // prefs.setString('auth', authData);
    } catch (error) {
      throw error;
    }
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

// var url = Uri.parse(
//                             'https://reexapi.herokuapp.com/users/login');
//                         final http.Response response = await http.post(
//                           url,
//                           headers: <String, String>{
//                             "Content-Type": 'application/json;charset=UTF-8',
//                             "Accept": 'application/json',
//                           },
//                           body: jsonEncode(
//                             <String, String>{
//                               'userId': userId,
//                               'password': password,
//                             },
//                           ),
//                         );
//                         final responseData = json.decode(response.body);
//                         print(responseData["user"]["_id"]);

//                         var parse;
//                         if (response.body.isNotEmpty) {
//                           parse = json.decode(response.body);
//                           print(parse["token"]);
//                           addTokenToSF();
//                           Navigator.pushNamed(context, EmpDashboard.id,
//                               arguments: {'id': responseData["user"]["_id"]});
//                         }
