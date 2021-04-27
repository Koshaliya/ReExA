import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var managerData,employeeData,userData;

Future<void> fetchManegerData() async {
    var sharedPreferencesX = await SharedPreferences.getInstance();

    var getToken = sharedPreferencesX.getString('token');

    final url = Uri.parse('https://reexapi.herokuapp.com/getallmanager');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": 'application/json;charset=UTF-8',
        "Accept": 'application/json',
        "Authorization": 'Bearer $getToken'
      },
    );
    managerData = json.decode(response.body).map((e) => e).toList();
    return managerData;
  }

  Future<void> fetchEmployeeData() async {
    
      var sharedPreferencesX = await SharedPreferences.getInstance();

      var getToken = sharedPreferencesX.getString('token');

      final url = Uri.parse('https://reexapi.herokuapp.com/getallemployee');
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          "Content-Type": 'application/json;charset=UTF-8',
          "Accept": 'application/json',
          "Authorization": 'Bearer $getToken'
        },
      );
      employeeData = json.decode(response.body);
    
  }

  Future<void> fetchUserData() async {
    
      var sharedPreferencesX = await SharedPreferences.getInstance();

      var getToken = sharedPreferencesX.getString('token');

      final url = Uri.parse('https://reexapi.herokuapp.com/getallusers');
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          "Content-Type": 'application/json;charset=UTF-8',
          "Accept": 'application/json',
          "Authorization": 'Bearer $getToken'
        },
      );
      userData = json.decode(response.body);
    
  }