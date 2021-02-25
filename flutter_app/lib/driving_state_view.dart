import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


import 'driving_data_view.dart';
import 'info_widget.dart';
class DrivingStateView extends StatefulWidget{
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
                const InfoWidget(
                    'Request location permission',
                    'Access to the device\'s location has been denied, please '
                        'request permissions before continuing'),
                RaisedButton(
                  child: const Text('Request permission'),
                  onPressed: () => Geolocator.requestPermission(),
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


          return DrivingDataView();
        });
  }

}

