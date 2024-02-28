
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:laundry_app/services/global.dart';

class  AuthService{
  static Future<http.Response>register(
      String name, String email, String password, String mobile, String confirmPassword)async{
    Map data = {
      "name":name,
      "email":email,
      "password":password,
      "mobile":mobile,
      "confirm_password":confirmPassword
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body:body
    );
    print(response.body);
    return response;
  }
  static Future<http.Response>login(
     String email, String password)async{
    Map data = {
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/login');
    http.Response response = await http.post(
        url,
        headers: headers,
        body:body
    );
    print(response.body);
    return response;
  }
}