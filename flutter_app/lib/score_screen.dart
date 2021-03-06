import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/post_service.dart';
import 'package:scidart/numdart.dart';

import 'Data.dart';
import 'login/user_account.dart';

class Score extends StatefulWidget {

  final List<Map<String,double>> list;

  Score({this.list}) ;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  Data map ;
  String mark ;
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: const Text('Popup Score'),
    content: new Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      sendData(mapGenerator())
    ],
    ),
    );
  }


  Data mapGenerator() {
    return map = new Data(UserAccount().user_id,widget.list,mark);
  }

  Text sendData(Data data) {

    Map<String, dynamic> dataJson= data.toJson(data);
    print(dataJson);
    final putData = jsonEncode(dataJson);
    print(putData);

    createPost2(putData).then((response) {
      if (response.statusCode >= 200)
        print(response.body);
    } // print(response.statusCode);
     ).catchError((error){
      print('error : $error');
    });


     return Text(
       'SEND'
     );
  }
}