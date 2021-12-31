import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_location_v3/models/user.dart';

var dio = Dio();
var url = 'http://10.0.2.2:1001/tracking-location/user/api/';
var uri = Uri.parse(url);

Login_Validate(username, password) async {
  var data = {
    'type': 'login',
    'username': username.text,
    'password': password.text
  };
  final response = await dio.post(url, data: data);
  print(response);
}

Get_All_User() async {
  final response = await http.get(uri);
  final jsonData = jsonDecode(response.body);
  return jsonData;
}