import 'package:flutter/material.dart';
import 'package:flutter_app/score_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'driving/driving_data_view.dart';

class DrivingStateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrivingStateViewState();
  }
}

class _DrivingStateViewState extends State<DrivingStateView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                RaisedButton(
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.cyanAccent),
                  ),
                  child: const Text('Request permission'),
                  onPressed: () => Geolocator.requestPermission(),
                ),
              ],
            );
          }

          if (snapshot.data == LocationPermission.deniedForever) {
            return Score();
          }

          return DrivingDataView();
        });
  }
}