import 'package:flutter/material.dart';
import 'package:flutter_app/database/controller/post_service.dart';
import 'package:flutter_app/driving/controller/driving_data_process.dart';
import 'package:flutter_app/driving/driving_data_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('filter', () {
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

    test('firstFilter test 3', () {
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 8, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 3, 'z': 0},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 9},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 10, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 5, 'z': 0},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 4},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': -3},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 3, 'z': 0},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 4},
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
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': -3},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
      ];
      _outputList = testClass.firstFilter(_testList);
      expect(_outputList, _expectList);
    });
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

    test('drivingGrade test 2', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1, 'y': 2.9, 'z': 0},
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.78,
          'y': 1.64,
          'z': 0
        },
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 2, 'y': -0.8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 2.5, 'y': 1, 'z': 0},
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.9,
          'y': -1.3,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.8,
          'y': 1.6,
          'z': 0
        },
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 3.0, 'y': -2, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 3.6, 'y': 1, 'z': 0},
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': -2.0,
          'y': -0.9,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.2,
          'y': 0.1,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': -0.9,
          'y': -0.6,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.78,
          'y': 0.8,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.92,
          'y': 1.0,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 1.3,
          'y': 1.2,
          'z': 0
        },
        {
          'time': 0,
          'latitude': 90,
          'longitude': 90,
          'x': 0.9,
          'y': -2.5,
          'z': 0
        }
      ];

      mark = testClass.drivingGrade(_testList);
      expect(mark, 1);
    });

    test('drivingGrade test 3', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 2.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1.64, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -0.8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -1.3, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1.6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -2, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -0.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0.1, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -0.6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 0.8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1.0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 1.2, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': -2.5, 'z': 0}
      ];

      mark = testClass.drivingGrade(_testList);
      expect(mark, 3);
    });

    test('drivingGrade test 4', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.78, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 2, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 2.5, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.9, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.8, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 3.0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 3.6, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': -2.0, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.2, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': -0.9, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.78, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.92, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 1.3, 'y': 0, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0.9, 'y': 0, 'z': 0}
      ];

      mark = testClass.drivingGrade(_testList);
      expect(mark, 2);
    });

    test('varianceOfList test 1', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8.1, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 6.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.77, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8.5, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8.7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'x': 0, 'y': 7.96, 'z': 0}
      ];

      testVariance = testClass.varianceOfList(_testList, "y");
      expect(testVariance, 0.4435838095238093);
    });

    test('varianceOfList test 2', () {
      _testList = [
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.6, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8.1, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 6.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.77, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8.5, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8.7, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.9, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 8, 'z': 0},
        {'time': 0, 'latitude': 90, 'longitude': 90, 'y': 0, 'x': 7.96, 'z': 0}
      ];

      testVariance = testClass.varianceOfList(_testList, "x");
      expect(testVariance, 0.4435838095238093);
    });
  });
}
