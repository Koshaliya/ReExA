
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Auth with ChangeNotifier {
  String _token;
  Object _user;
  
  String _userRole;

  String userInputDate;

  

  Future<void> authenticate(String userId, String password) async {
    try {
      // print(userId);
      // print(password);
      final url = Uri.parse('https://reexapi.herokuapp.com/users/login');
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          "Content-Type": 'application/json;charset=UTF-8',
          "Accept": 'application/json',
        },
        body: jsonEncode(
          {
            'userId': userId,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _user = responseData['user'];
      _token = responseData['token'];
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final authData = json.encode({
        'token': _token,
        'user': _user,
      });
      prefs.setString('auth', authData);
      // print(authData);

      var sharedPreferencesToken = await SharedPreferences.getInstance();
      sharedPreferencesToken.setString('token', _token);
      // print('shared Token = ');
      // print(sharedPreferencesToken.getString('token'));

      String userJson = jsonEncode(_user);
      var sharedPreferencesUser = await SharedPreferences.getInstance();
      sharedPreferencesUser.setString('user', userJson);
      // print('shared user = ');

      String s = sharedPreferencesUser.getString('user');
      var currentuser = jsonDecode(s);
      // print(currentuser);
      _userRole = currentuser['role'];
      // print(_userRole);
      var sharedPreferencesRole = await SharedPreferences.getInstance();
      sharedPreferencesRole.setString('userRole', _userRole);

    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> logOut() async {
    // _token = null;

    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print(prefs.getString('token'));
    print(prefs.getString('user'));
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
