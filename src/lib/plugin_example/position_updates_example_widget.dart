import 'dart:async';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:sensors/sensors.dart';

import 'widgets/info_widget.dart';

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
  <StreamSubscription<dynamic>>[];
  final _positions = <Position>[];

  final _accelerometerEvent =< AccelerometerEvent>[];// store the accelerometer data .


  @override
  Widget build(BuildContext context) {


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

  Widget _buildListView() {
    final listItems = <Widget>[
      ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              child: _buildButtonText(),
              color: _determineButtonColor(),
              padding: const EdgeInsets.all(8.0),
              onPressed: _toggleListening,
            ),
            RaisedButton(
              child: Text('Clear'),
              padding: const EdgeInsets.all(8.0),
              onPressed: () => setState(_positions.clear),
            ),
          ],
        ),
      ),


    ];



    /*
    listItems.addAll(_positions.map((position) {

      return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'GPS:   ${position.latitude}, ${position.longitude}',
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
            ),

            Text(
              position.timestamp.toString(),
              style: const TextStyle(fontSize: 12.0, color: Colors.black),
            ),
          ],
        ),
      );
    }));*/



    /*listItems.addAll(_accelerometerEvent.map((acc) {

      return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Acc:   ${acc.x}, ${acc.y}, ${acc.z}',
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
            ),


          ],
        ),
      );
    }));


    return ListView(
      children: listItems,
    );
  }
  */


  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);

  Widget _buildButtonText() {
    return Text(_isListening() ? 'Stop listening' : 'Start listening');
  }

  Color _determineButtonColor() {
    return _isListening() ? Colors.red : Colors.green;
  }

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
        _accelerometerEvent.add(event);

      });
    }));

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
      } else {
        _positionStreamSubscription.pause();
      }


    });

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
    super.dispose();
  }
}
