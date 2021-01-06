import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:sensors/sensors.dart';

import 'widgets/info_widget.dart';

import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission/permission.dart';

/// A widget that will request and display position updates
/// using the device's location services.
class PositionUpdatesExampleWidget extends StatefulWidget {
  @override
  _PositionUpdatesExampleWidgetState createState() =>
      _PositionUpdatesExampleWidgetState();
}

class _PositionUpdatesExampleWidgetState extends State<PositionUpdatesExampleWidget> {

  StreamSubscription<Position> _positionStreamSubscription;
  AccelerometerEvent event;
  Position position;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
  <StreamSubscription<dynamic>>[];//use to store the events and cancel or pause the events.
  final _positions = <Position>[];

  final _accelerometerEvent =< AccelerometerEvent>[];// store the accelerometer data .
  final _storeList = <List<double>>[];

  @override
  Widget build(BuildContext context) {

    /// main
    return FutureBuilder<LocationPermission>(
        future: Geolocator.checkPermission(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == LocationPermission.denied) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const InfoWidget(
                    'Request location permission',
                    'Access to the device\'s location has been denied, please '
                        'request permissions before continuing'),
                RaisedButton(
                  child: const Text('Request permission'),
                  onPressed: () => Geolocator.requestPermission()
                      .then((status) => setState(_positions.clear)),
                ),
              ],
            );
          }

          if (snapshot.data == LocationPermission.deniedForever) {
            return const InfoWidget(
                'Access to location permanently denied',
                'Allow access to the location services for this App using the '
                    'device settings.');
          }

          return _buildListView();
        });
  }

  /// Top control button and information display module
  /// author: Shihui QUE
  Widget _buildListView() {
    var box = new SizedBox(
      child: new Column(
        children: [
          RaisedButton(
            child: _buildButtonText(),
            color: _determineButtonColor(),
            padding: const EdgeInsets.all(8.0),
            onPressed: _toggleListening,
          ),
          ListTile(
            title: new Text(  _cardTextGPS() ,
                style: new TextStyle(fontWeight: FontWeight.w500)),
            subtitle: new Text(_cardTextAcc() ),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          )
        ],
      ),
    );

    return Card(
      child: box,
    );
  }
  // AccelerometerEvent acc = _accelerometerEvent.last;
  // Position pos =  _positions.last;

  /// Returns current GPS data
  /// author: Shihui QUE
  String  _cardTextGPS() {
    if(position != null && event != null){
      return 'GPS:  ${ position.latitude}, ${ position.longitude}';
    } else {
      return 'GPS: wait';
    }
  }

  /// Returns current accelerometer data
  /// author: Shihui QUE
  String  _cardTextAcc() {
    if(position != null && event != null){
      return 'Acc:   ${event.x}, ${event.y}, ${event.z}';
    } else {
      return 'Acc: wait';
    }
  }





  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);

  /// Change color and text of button
  Widget _buildButtonText() {
    return Text(_isListening() ? 'Stop listening' : 'Start listening');
  }

  Color _determineButtonColor() {
    return _isListening() ? Colors.red : Colors.green;
  }

  /// Switch of listening
  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }).listen((position) => setState((){
        _positions.add(position);
        this.position=position;
      }));
      _positionStreamSubscription.pause();
    }


    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        this.event=event;
        _accelerometerEvent.add(event);//
        _storeList.add([currentMillSecond(), position.longitude, position.latitude, event.x, event.y, event.z]); //each time new piece of data generated, added to _storeList
      });
    }));

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
        print(_accelerometerEvent.length);
      } else {
        _positionStreamSubscription.pause();
      }


    });

  }

  /// gets current time
  double currentMillSecond(){
    return new DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  ///find out the path of .csv
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    //print("1");
    return directory.path;
  }

  ///get .csv file as file var
  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/StoreAcc.csv');
  }
  
  ///store list to CSV
  Future<File> _storeListToCSV(List _targetList) async {
    String csv = const ListToCsvConverter().convert(_targetList);
    //print(csv);
    final file = await _localFile;
    return file.writeAsString(csv);
  }

  // Future<File> _storeListToTXT(String _targetString) async {
  //   //print(csv);
  //   final file = await _localFile;
  //   return file.writeAsString(_targetString);
  // }


  ///read csv file to list
  Future<List<dynamic>> readFromFile() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(contents);
      print(rowsAsListOfValues);
      //print(rowsAsListOfValues.length);
      return rowsAsListOfValues;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
  }

  @override
  void initState(){
    print("initState Now");
    super.initState();
  }


  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    _storeListToCSV(_storeList); // convert double list to csv stream and store in csv file
    //print(_accelerometerEvent2.length);
    readFromFile(); // test sentence, read form csv file
    print("terminates");
    super.dispose();
  }
}
