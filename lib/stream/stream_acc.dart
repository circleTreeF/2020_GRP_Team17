
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sensors/sensors.dart';

class StreamAcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream_Acc'),
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

    AccelerometerEvent event;
    StreamController<String> _streamAcc;
    StreamSink _streamSink;
    List<double> _accelerometerValues;  //create a list to store the acc value
    List<StreamSubscription<dynamic>> _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void dispose(){
      _streamAcc.close();
      super.dispose();
}

  @override
  void initState(){
    super.initState();
    _streamSubscriptions.add(_accelerometerEvent(event));//call method to get the current accelerometer and add the data to the stream list
    _streamAcc=StreamController.broadcast();
    _streamSink=_streamAcc.sink;//create a sink to store the data in stream.
  }


  //fetch data
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    return this.event.toString();
  }


  void _addDataToStream() async{
    String data =await fetchData();
    _streamSink.add(data); //add data to stream
  }


   _accelerometerEvent(AccelerometerEvent event) {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState((){
        _accelerometerValues= <double>[event.x, event.y, event.z];
      });
      this.event = event;
      this._accelerometerValues= _accelerometerValues;
      _addDataToStream();  //listen the acc event and add data to stream
    });

  }


  // display
  @override
  Widget build(BuildContext context) {

    final List<String> accelerometer =
    _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    
    return Container(
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

           /* StreamBuilder(

            stream: _streamAcc.stream,

              builder: (context,snapshot)=> Text('${snapshot.data}'),//display on the screen
            ),
           */


            Text('Accelerometer: $accelerometer'),


  ]
      ),
    )
    );
  }


}