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
    // Text(drivingGrade().toString()),
      //Text("score"),
      sendData(mapGenerator())
    ],
    ),
    );
  }


  //score method

  // String drivingGrade(){
  //   List _targetList=widget.list;
  //
  //   double varianceX = 0;
  //   double varianceY = 0;
  //
  //   const double standardX = 0; // threshold in X axis, needs to be calculated
  //   const double standardY = 0; // threshold in Y axis, needs to be calculated
  //
  //   varianceX = varianceOfList(_targetList, "x");
  //   varianceY = varianceOfList(_targetList, "Z");//??
  //
  //   if (varianceX <= standardX){
  //     if(varianceY <= standardY){
  //       mark = 'D' ;
  //     }else{
  //       mark = 'C' ;
  //     }
  //   }else if(varianceY <= standardY){
  //     mark = 'B' ;
  //   }else{
  //     mark ='A' ;
  //   }
  //
  //   return mark;
  // }


  // double varianceOfList(List _targetList, String key){
  //   double varianceOfList = 0;
  //   List<double> numberList = [];
  //
  //   int counter = 0;
  //
  //   for(counter = 0; counter < _targetList.length; counter++){
  //     numberList.add(_targetList[counter]["key"]);
  //   }
  //   Array numberArray = Array(numberList);
  //   varianceOfList = variance(numberArray);
  //
  //   //print(varianceOfList);
  //
  //   return varianceOfList;
  // }

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
      //else
    } // print(response.statusCode);
     ).catchError((error){
      print('error : $error');
    });


     return Text(
       'SEND'
     );
  }
}