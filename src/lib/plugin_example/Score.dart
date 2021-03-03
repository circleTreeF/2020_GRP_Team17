
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
    return Scaffold(
      appBar: AppBar(

        title: Text("score"),
      ),
      body: new Text(_scoreGenerator(),
          style: new TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  //score method
  String _scoreGenerator() {
    print('${widget.list.last}');
      if(widget.list.last>=0){
        _score= 'A';
      }
      //TODO
    return ' $_score';
  }
}