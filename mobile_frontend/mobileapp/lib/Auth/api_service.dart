import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobileapp/Auth/config.dart';
import 'package:mobileapp/Auth/login_request_model.dart';
import 'package:mobileapp/Auth/login_response_model.dart';
import 'package:mobileapp/Auth/shared.dart';
import 'package:mobileapp/Auth/sign_request_model.dart';
import 'package:mobileapp/Auth/sign_response_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(login_request_model model) async{
    Map<String, String> requestHeaders={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var url = Uri.http(Config.apiUrl,Config.loginAPI);
    
    var response = await client.post(
      url,
      headers:requestHeaders,
      body:jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      await SharedService.setLoginDetails(LoginResponseJson(response.body));
      return true;
    } else {
      return false;} 
    }


  static Future<RegisterResponse> register(sign_request_model model) async{
    print("your name is: ${model.fullname}");

    print("your name is: ${model.fullname}");
    Map<String, String> requestHeaders={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var url = Uri.http(Config.apiUrl,Config.registerAPI);
    print("url id:$url");
    var response = await client.post(
      url,
      headers:requestHeaders,
      body:jsonEncode(model.toJson()),
    );
    return registerResponseFromJson(response.body);
    }
}