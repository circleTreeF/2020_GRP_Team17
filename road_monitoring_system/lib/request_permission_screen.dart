

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:road_monitoring_system/score_screen.dart';

import 'driving/driving_screen.dart';

class DrivingStateView extends StatefulWidget {
  @override

  DrivingStateViewState createState() {
    // TODO: implement createState
    return DrivingStateViewState();
  }
}

class DrivingStateViewState extends State<DrivingStateView> {
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
            return
              Column(
                  children: <Widget>[
              SizedBox(height: ScreenUtil.getInstance().setHeight(300)),
              Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                  child: const Text('Request permission',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      DrivingScreen();
                      Geolocator.requestPermission();
                    });
                    }
                ),
              ],
            ),
              ),
                  ],
          );
          }

          if (snapshot.data == LocationPermission.deniedForever) {
            return Score();
          }

          return DrivingScreen();
        });

  }
}
