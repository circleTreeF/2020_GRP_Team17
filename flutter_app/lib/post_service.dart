


import 'dart:io';

import 'package:flutter_app/post_model.dart';
import 'package:http/http.dart' as http;

String url = 'http://10.6.2.61:8866/statistics/get_record';
String url1= 'http://10.6.2.61:8866/statistics/user_login';

Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async{
  final response = await http.get('$url/1');
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
  final response = await http.get('$url1');
  return post1FromJson(response.body);
}

Future<http.Response> createPost1(Post1 post) async{
  final response = await http.post('$url1',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: post1ToJson(post)
  );
  return response;
}



