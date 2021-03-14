import 'package:flutter/material.dart';
import 'package:flutter_app/driving/controller/driving_data_process.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('data view', () {
    DrivingDataProcess testClass = new DrivingDataProcess();
    List<Map<String, double>> _testList = <Map<String, double>>[];
    List<Map<String, double>> _outputList = <Map<String, double>>[];
    List<Map<String, double>> _expectList = <Map<String, double>>[];

    test('firstFilter test 1', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _expectList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _outputList = testClass.firstFilter(_testList);
      expect(_outputList, _expectList);
    });

    test('firstFilter test 2', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _expectList = [];
      _outputList = testClass.firstFilter(_testList);
      expect(_outputList, _expectList);
    });

    test('', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _expectList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _outputList = testClass.firstFilter(_testList);
      expect(_outputList, _expectList);
    });

    test('', () {});
  });

  group('score', () {
    DrivingDataProcess testClass = new DrivingDataProcess();
    List<Map<String, double>> _testList = <Map<String, double>>[];
    int mark = 0;
    double testVariance = 0;

    test('drivingGrade test 1', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];

      mark = testClass.drivingGrade(_testList);
      expect(mark, 4);
    });

    test('', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];

      mark = testClass.drivingGrade(_testList);
      expect(mark, 4);
    });

    test('varianceOfList test 1', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];

      testVariance = testClass.varianceOfList(_testList, "x");
      expect(testVariance, 0);
    });
  });
}
