

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';

class Users {

  String token;
  var manager;


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

      manager = responseData['userId'];
      String managerJson = jsonEncode(manager);
      var sharedPreferencesManager = await SharedPreferences.getInstance();
      sharedPreferencesManager.setString('managers', managerJson);
      

     return responseData;

    } catch (error) {
      print(error);
      throw error;
    }
  }
}
