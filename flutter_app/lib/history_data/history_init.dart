import 'dart:convert';

import 'package:flutter_app/history_data/model/history_list_data.dart';
import 'package:flutter_app/post_model.dart';
import 'package:flutter_app/post_service.dart';
import 'package:flutter_app/user_list.dart';

class DataListGenerator {


  // void postNet_2() async {
  //
  //
  //   createPost(new Post(user_id: 4936)).then((response){
  //     if(response.statusCode >=200){
  //       //print(response.body);
  //       String _content = response.body;
  //       final _userMap= jsonDecode(_content);
  //       //print(_userMap);
  //       UserList userList =UserList.fromJson(_userMap);
  //
  //       for(int i=0; i<userList.users.length;i++){
  //         HistoryDataList _historyDataList;
  //         _historyDataList.start_time=userList.users[i].start_time;
  //         _historyDataList.end_time=userList.users[i].end_time;
  //         _historyDataList.round_mark=userList.users[i].round_mark;
  //         HistoryDataList.historyList.add( _historyDataList);
  //       }
  //
  //     }
  //     else
  //       print(response.statusCode);
  //   }).catchError((error){
  //     print('error : $error');
  //   });
  //
  // }
}