



import 'package:flutter/material.dart';

class Score extends StatefulWidget {


  final List<double> list;

  Score({this.list}) ;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  String _score;
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: const Text('Popup Score'),
    content: new Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
     Text( _scoreGenerator()),
    ],
    ),
    );
  }


  //score method
  String _scoreGenerator() {
    print('${widget.list.last}');
    if(widget.list.last>=10){
      _score= 'A';
      return ' $_score';
    }
    else
    if(widget.list.last>=0){
      _score= 'B';
      return ' $_score';
    }
    return 'C';
    //TODO

  }
}