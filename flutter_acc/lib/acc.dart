

import 'package:sensors/sensors.dart';

class AccSensor {
  AccelerometerEvent _event;

  AccelerometerEvent get event => _event;
  UserAccelerometerEvent _event1;


   accelerometerEvent( AccelerometerEvent event) {
    accelerometerEvents.listen((AccelerometerEvent accEvent) {
      this._event = accEvent;
     // print(_event);
    });
    return this._event;
  }

  UserAccelerometerEvent userAccelerometerEvent() {
    userAccelerometerEvents.listen((UserAccelerometerEvent userEvent) {
      this._event1 = userEvent;

    });
    return this._event1;
  }

  UserAccelerometerEvent get event1 => _event1;
}
