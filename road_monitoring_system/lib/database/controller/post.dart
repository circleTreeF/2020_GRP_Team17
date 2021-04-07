


import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:road_monitoring_system/database/model/User.dart';



///The header of the database website
String header ='http://10.6.2.61:8866/statistics/';
///The url for getting the history record
String getRecord = header+'get_record';
///The url for user login
String login= header+ 'app/user/login';
///The url for adding the history record
String addRecord= header+ 'add/record';
///The url for user register
String register= header+ 'app/user/register';


/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/1 6:43 PM
*** @version:1.0
**/

///Creates HTTP [POST] Request for users to login
Future<http.Response> createPostToLogin(User post) async{
  final response = await http.post('$login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: userToJson(post)
  );
  return response;
}
/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/1 6:43 PM
*** @version:1.0
**/
///Creates HTTP [POST] Request for users to register
Future<http.Response> createPostToRegister(User post) async{
  final response = await http.post('$register',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: userToJson(post)
  );
  return response;
}

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/1 6:44 PM
*** @version:1.0
**/
///Creates HTTP [POST] Request for adding history data record
Future<http.Response> createPostToAddRecord(String data) async{
  final response = await http.post('$addRecord',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: data
  );
  return response;
}








