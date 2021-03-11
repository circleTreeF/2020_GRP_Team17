


import 'dart:io';

import 'package:flutter_app/database/model/post_model.dart';
import 'package:flutter_app/login/model/user_account.dart';
import 'package:http/http.dart' as http;



String url = 'http://10.6.2.61:8866/statistics/get_record';
String login= 'http://10.6.2.61:8866/statistics/app/user/login';
String record= 'http://10.6.2.61:8866/statistics/add/record';
String register= 'http://10.6.2.61:8866/statistics/app/user/register';

Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async{
  final response = await http.get('$url');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post)
  );
  return response;
}

Future<List<Post1>> getAllPost1s() async {
  final response = await http.get(url);
  print(response.body);
  return allPost1sFromJson(response.body);
}

Future<Post1> getPost1() async{
  final response = await http.get('$login');
  return post1FromJson(response.body);
}

Future<http.Response> createPost1(Post1 post) async{
  final response = await http.post('$login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: post1ToJson(post)
  );
  return response;
}

Future<http.Response> createPost3(Post1 post) async{
  final response = await http.post('$register',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: post1ToJson(post)
  );
  return response;
}



Future<http.Response> createPost2(String data) async{
  final response = await http.post('$record',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: data
  );
  return response;
}








