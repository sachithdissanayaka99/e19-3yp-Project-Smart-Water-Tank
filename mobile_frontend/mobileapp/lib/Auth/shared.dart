import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/Auth/login_response_model.dart';

class SharedService{
  static Future<bool> isLoggedIn() async{
    var iskeyExist = await APICacheManager().isAPICacheKeyExist('Login_details');

    return iskeyExist;
  }

  static Future<LoginResponse?> loginDetails() async{
    var iskeyExist = 
    await APICacheManager().isAPICacheKeyExist('Login_details');

    if(iskeyExist){
      var cacheData = await APICacheManager().getCacheData('Login_details');
      var response = LoginResponseJson(cacheData.syncData);
      return response;
    }
  }
static Future<void> setLoginDetails(LoginResponse model,) async{
  APICacheDBModel cacheDBModel = APICacheDBModel(
    key: 'Login_details',
    syncData: jsonEncode(model.toJson()),);

    await APICacheManager().addCacheData(cacheDBModel);

  }

static Future<void> logout(BuildContext context) async{
  await APICacheManager().deleteCache('Login_details');
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false); 
}
}