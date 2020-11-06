
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
    AccelerometerEvent event;  //use the class or just method?
   StreamSubscription _streamAccSubscription;
    StreamController<String> _streamAcc;
    StreamSink _streamSink;
    String _data='no data';

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
    _streamAccSubscription=_streamAcc.stream.listen(onData);//if the data is changed,call onData
    _streamSink=_streamAcc.sink;
    print('completed');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    return acc.accelerometerEvent(event).toString();
  }

  void onData(String data){

  setState((){
    _data=data;   //change the data in stream
  });
    //print("$data");
  }

/*decide when to start or pause*/
  void _pauseStream(){
    print('pause');
    _streamAccSubscription.pause();
  }
  void _resumeStream(){
    print('resume');
    _streamAccSubscription.resume();
  }

  void _addDataToStream() async{

    String data =await fetchData();
    _streamSink.add(data); //add data to stream
  }


  void  _accelerometerEvent(AccelerometerEvent event) {
    accelerometerEvents.listen((AccelerometerEvent accEvent) {
      this.event = accEvent;
      _addDataToStream();  //listen the acc event and add data to stream
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
              builder: (context,snapshot)=> Text('${snapshot.data}'),//display on the screen
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center ,

           //maybe this part can control the start and end time
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