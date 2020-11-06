/*

 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_acce/acc.dart';
import 'package:sensors/sensors.dart';

class StreamAcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
       body: StreamAccHome(),
    );

  }
}

class StreamAccHome extends StatefulWidget {
  @override
  _StreamAccHomeState createState() => _StreamAccHomeState();


}

class _StreamAccHomeState extends State<StreamAccHome>{
    AccSensor acc=new AccSensor();
    AccelerometerEvent event;
    StreamSubscription _streamAccSubscription;
    StreamController<String> _streamAcc;
    StreamSink _streamSink;
    String _data='0.00';
@override
void dispose(){
    _streamAcc.close();
    super.dispose();
}

  @override
  void initState(){
    super.initState();
    _accelerometerEvent(event);
    _streamAcc=StreamController.broadcast();
    _streamAccSubscription=_streamAcc.stream.listen(onData);
    _streamSink=_streamAcc.sink;
    print('completed');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    return acc.accelerometerEvent(event).toString();
  }

  void onData(String data){

  setState((){
    _data=data;
  });
    //print("$data");
  }


  void _pauseStream(){
    print('pause');
    _streamAccSubscription.pause();
  }
  void _resumeStream(){
    print('resume');
    _streamAccSubscription.resume();
  }

  void _addDataToString() async{

    String data =await fetchData();
    //_streamDemo.add(data);
    _streamSink.add(data);
  }


  void  _accelerometerEvent(AccelerometerEvent event) {
    accelerometerEvents.listen((AccelerometerEvent accEvent) {
      this.event = accEvent;
      _addDataToString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
            stream: _streamAcc.stream,
              builder: (context,snapshot)=> Text('${snapshot.data}'),
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
              FlatButton(
                child: Text('log in'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('log out'),
                onPressed: _pauseStream,
              ),

            ],
          ),
  ]
      ),
    )
    );
  }


}