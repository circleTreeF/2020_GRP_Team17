import 'package:flutter/material.dart';
import 'package:scidart/numdart.dart';

class Score extends StatefulWidget {

  final List<double> list;

  Score({this.list}) ;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: const Text('Popup Score'),
    content: new Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
     Text(drivingGrade().toString()),
    ],
    ),
    );
  }


  //score method

  int drivingGrade(){
    List _targetList=widget.list;
    int mark = 0;
    double varianceX = 0;
    double varianceY = 0;

    const double standardX = 0; // threshold in X axis, needs to be calculated
    const double standardY = 0; // threshold in Y axis, needs to be calculated

    varianceX = varianceOfList(_targetList, 3);
    varianceY = varianceOfList(_targetList, 5);

    if (varianceX <= standardX){
      if(varianceY <= standardY){
        mark = 4;
      }else{
        mark = 3;
      }
    }else if(varianceY <= standardY){
      mark = 2;
    }else{
      mark = 1;
    }

    return mark;
  }


  double varianceOfList(List _targetList, int index){
    double varianceOfList = 0;
    List<double> numberList = [];

    int counter = 0;

    for(counter = 0; counter < _targetList.length; counter++){
      numberList.add(_targetList[counter].elementAt(index));
    }
    Array numberArray = Array(numberList);
    varianceOfList = variance(numberArray);

    print(varianceOfList);

    return varianceOfList;
  }


}