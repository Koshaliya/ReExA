
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';

class User {

  String token;
  Object manager;

  Future<List> getManagers() async {
    try {
      var sharedPreferencesX = await SharedPreferences.getInstance();

      var getToken = sharedPreferencesX.getString('token');
      print(getToken);
      final url = Uri.parse('https://reexapi.herokuapp.com/getallmanager');
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          "Content-Type": 'application/json;charset=UTF-8',
          "Accept": 'application/json',
          "Authorization": 'Bearer $getToken'
        },
      );
      final responseData = json.decode(response.body);
print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      // _user = responseData['user'];
      // _token = responseData['token'];
    
      // final prefs = await SharedPreferences.getInstance();
      // final authData = json.encode({
      //   'token': _token,
      //   'user': _user,
      // });
      // prefs.setString('auth', authData);
      // // print(authData);

      // var sharedPreferencesToken = await SharedPreferences.getInstance();
      // sharedPreferencesToken.setString('token', _token);
      // print('shared Token = ');
      // print(sharedPreferencesToken.getString('token'));

      // String userJson = jsonEncode(_user);
      // var sharedPreferencesUser = await SharedPreferences.getInstance();
      // sharedPreferencesUser.setString('user', userJson);
      // print('shared user = ');

     return responseData;

      // var saved_val = sp.getString('key');
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
