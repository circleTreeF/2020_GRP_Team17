
import 'package:flutter/material.dart';

import 'demo/stream/stream_acc.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/stream',
      routes: {
        '/stream': (context) =>StreamAcc(),

      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class StateManagementDemo {
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void initState(){
//   accelerometerEvents.listen((AccelerometerEvent event) {


    super.initState();
 // },
 //   );
        }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text(widget.title)
      ),

        body:Center(
          child: Container(
            child: Column(

            ),
          ),
        )

    );
}

}

