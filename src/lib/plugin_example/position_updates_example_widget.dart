import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_road/plugin_example/Score.dart';
import 'package:sensors/sensors.dart';

import 'widgets/info_widget.dart';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

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
  StreamSubscription _streamSubscriptions; //use to store the events and cancel or pause the events.
  final _positions = <Position>[];
  final _accelerometerEvent = <AccelerometerEvent>[
  ]; // store the accelerometer data .
  final _storeAccZFirstFilterList = <double>[];

  get storeAccZFirstFilterList => _storeAccZFirstFilterList;
  List<List<double>> _storeList = <List<double>>[]; //list after first filter
  List<List<double>> _finalList = <List<double>>[]; //list after second filter
  int _accZ;

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
                  onPressed: () =>
                      Geolocator.requestPermission()
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
            child: _buildButtonText0(),
            color: _determineButtonColor0(),
            padding: const EdgeInsets.all(8.0),
            onPressed: _toggleListeningGPS,
          ),
          ListTile(
            title: new Text(_cardTextGPS(),
                style: new TextStyle(fontWeight: FontWeight.w500)),
            // subtitle: new Text(_cardTextAcc() ),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          RaisedButton(
            child: _buildButtonText1(),
            color: _determineButtonColor1(),
            padding: const EdgeInsets.all(8.0),
            onPressed: _toggleListeningAcc,
          ),
          RaisedButton(
            child: _buildButtonText2(),
            color: _determineButtonColor2(),
            padding: const EdgeInsets.all(8.0),
            onPressed: _pauseStream,
          ),
          ListTile(
            title: new Text(_cardTextAccX(),
                style: new TextStyle(fontWeight: FontWeight.w500)),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: new Text(_cardTextAccY(),
                style: new TextStyle(fontWeight: FontWeight.w500)),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: new Text(_cardTextAccZ(),
                style: new TextStyle(fontWeight: FontWeight.w500)),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          // RaisedButton(
          //   child: _buildButtonText3(),
          //   color: _determineButtonColor3(),
          //   padding: const EdgeInsets.all(8.0),
          //   onPressed: _readAccZ,
          // ),
          RaisedButton(
            child: Text('Score'),
            color: _determineButtonColor2(),
            padding: const EdgeInsets.all(8.0),
            onPressed: () { // route for the scorePage.
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          Score(list: _storeAccZFirstFilterList)
                  )
              );
            },
          ),
        ],
      ),
    );

    return Card(
      child: box,
    );
  }

// pause the acc stream subscription
  void _pauseStream() {
    _streamSubscriptions.pause();
  }


  /// Returns current GPS data
  /// author: Shihui QUE
  String _cardTextGPS() {
    if (position != null) {
      return 'GPS:  ${ position.latitude}, ${ position.longitude}';
    } else {
      return 'GPS: wait';
    }
  }

  /// Returns current accelerometer data
  /// author: Shihui QUE
  String _cardTextAccX() {
    if (event != null) {
      return 'Acc_X:   ${event.x.roundToDouble()}';
    } else {
      return 'Acc: wait';
    }
  }


  String _cardTextAccY() {
    if (event != null) {
      return 'Acc_Y:    ${event.y.roundToDouble()}';
    } else {
      return 'Acc: wait';
    }
  }

  String _cardTextAccZ() {
    if (event != null) {
      return 'Acc_Z:    ${event.z.roundToDouble()}';
    } else {
      return 'Acc: wait';
    }
  }

  String _cardText() {
    return 'AccZ : $_accZ';
  }


  bool _isListeningPosition() =>
      !(_positionStreamSubscription == null ||
          _positionStreamSubscription.isPaused);

  /// Change color and text of button
  Widget _buildButtonText0() {
    return Text(_isListeningPosition()
        ? 'Stop listening Position'
        : 'Start listening Position');
  }

  Widget _buildButtonText1() {
    return Text('Start listening Position');
  }

  Widget _buildButtonText2() {
    return Text('Stop listening Position');
  }

  Widget _buildButtonText3() {
    return Text('read file');
  }


  Color _determineButtonColor0() {
    return _isListeningPosition() ? Colors.red : Colors.green;
  }


  Color _determineButtonColor1() {
    return Colors.green;
  }


  Color _determineButtonColor2() {
    return Colors.red;
  }

  Color _determineButtonColor3() {
    return Colors.amber;
  }

  /// Switch of listening
  void _toggleListeningGPS() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }).listen((position) =>
          setState(() {
            _positions.add(position);
            this.position = position;
          }));
      _positionStreamSubscription.pause();
    }

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
      } else {
        _positionStreamSubscription.pause();
      }
    });
  }

  void _toggleListeningAcc() {
    double timeStamp;
    double lastTime = 0;

    _streamSubscriptions =
        accelerometerEvents.listen((AccelerometerEvent event) {
          setState(() {
            this.event = event;
            _accelerometerEvent.add(event);

            if (_storeList.isNotEmpty) lastTime = _storeList.last.first;
            timeStamp = currentMillSecond();
            if (lastTime+100 <= timeStamp){
              //keep the 100 millisecond time slot
              _storeList.add([
                timeStamp,
                position.longitude,
                position.latitude,
                event.x,
                event.y,
                event.z
              ]); //each time new piece of data generated, added to _storeList
            }
          }
          );
        });
  }

  /// gets current time
  double currentMillSecond() {
    return new DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  ///find out the path of .csv
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  ///get .csv file as file var
  Future<File> get _localFile async {
    final path = await _localPath;
    //print(path);
    return File('$path/StoreAcc.csv');
  }

  ///store list to CSV
  Future<File> _storeListToCSV(List _targetList) async {
    String csv = const ListToCsvConverter().convert(_targetList);
    final file = await _localFile;
    return file.writeAsString(csv);
  }


  ///read csv file to list
  Future<List<dynamic>> readFromFile() async {
    try {
      final file = await _localFile;
      int counter = 0;

      String contents = await file.readAsString();
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter()
          .convert(contents);
      //print(rowsAsListOfValues);
      print(rowsAsListOfValues.length);

      for(counter = 0; counter < rowsAsListOfValues.length; counter++){
        print(rowsAsListOfValues[counter]);
      }

      return rowsAsListOfValues;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }

    //secondFilterCompact(); // second filter to compact before being stored into csv file
    _finalList = firstFilter(_storeList);
    _storeListToCSV(_finalList);
    //_storeListToCSV(_finalList); // convert double list to csv stream and store in csv file
    readFromFile(); // test sentence, read form csv file
    //print(_storeAccZFirstFilterList);//test the accZ
    print("terminates");
    super.dispose();
  }

  ///first filter: denoise the data in _storeList
  List<List<double>> firstFilter(List _targetList) {
    List<List<double>> _outputList = <List<double>>[];

    int counter = 0;
    int abandonLength = 30;

    double currentX = 0;
    double currentY = 0;
    double currentZ = 0;

    double standardX = 0;
    double standardY = 0;
    double standardZ = 0;
    double sumX = 0;
    double sumY = 0;
    double sumZ = 0;

    const double thresholdForX = 4;
    const double thresholdForY = 4;
    const double thresholdForZ = 4;

    for (counter = abandonLength; counter < _targetList.length - abandonLength; counter++){
      sumX = sumX + _targetList[counter].elementAt(3);
      sumY = sumY + _targetList[counter].elementAt(4);
      sumZ = sumZ + _targetList[counter].elementAt(5);
      standardX= sumX / (counter - abandonLength);
      standardY= sumY / (counter - abandonLength);
      standardZ= sumZ / (counter - abandonLength);
    }

    for (counter = abandonLength; counter < _targetList.length - abandonLength; counter++) {
      currentX = _targetList[counter].elementAt(3);
      currentY = _targetList[counter].elementAt(4);
      currentZ = _targetList[counter].elementAt(5);
      if ((currentX <= standardX + thresholdForX)&&(currentX >= standardX - thresholdForX)&&
          (currentY <= standardY + thresholdForY)&&(currentY >= standardY - thresholdForY)&&
          (currentZ <= standardZ + thresholdForZ)&&(currentZ >= standardZ - thresholdForZ)) {
        _outputList.add(_targetList[counter]);
      }
    }

    return _outputList;
  }

  ///second filter to compact
  List<List<double>> secondFilterCompact(List _targetList) {
    List<List<double>> _outputList = <List<double>>[];

    int counter = 0;
    const int sliceSize = 10;

    for (counter = 0; counter < _targetList.length; counter++) {
      if (counter % sliceSize == sliceSize - 1) {
        _outputList.add(_targetList[counter]);
      }
    }

    return _outputList;
  }

  // int drivingGrade(List _targetList){
  //   int mark = 0;
  //   double varianceX = 0;
  //   double varianceY = 0;
  //
  //   const double standardX = 0;
  //   const double standardY = 0;
  //
  //   varianceX = varianceOfList(_targetList, 3);
  //   varianceY = varianceOfList(_targetList, 5);
  //
  //   if (varianceX <= standardX){
  //     if(varianceY <= standardY){
  //       mark = 0;
  //     }else{
  //       mark = 0;
  //     }
  //   }else if(varianceY <= standardY){
  //     mark = 0;
  //   }else{
  //     mark = 0;
  //   }
  //
  //   return mark;
  // }
  //
  // double varianceOfList(List _targetList, int index){
  //   double variance = 0;
  //
  //   return variance;
  // }

}