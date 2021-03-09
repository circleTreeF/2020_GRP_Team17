import 'package:flutter/material.dart';
import 'package:flutter_app/driving/controller/driving_data_process.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  List<Map<String,double>> _testList = <Map<String,double>>[];
  List<Map<String,double>> _outputList = <Map<String,double>>[];
  List<Map<String,double>> _expectList = <Map<String,double>>[];

  _testList = [
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
  ];

  _expectList = [
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0},
    {'time':0, 'latitude':90, 'longitude': 90, 'x': 0, 'y': 0, 'z': 0}
  ];

  group('data view',(){
    test('sample test', (){
      DrivingDataProcess testClass = new DrivingDataProcess();
      print(_testList.length);
      _outputList = testClass.firstFilter(_testList);
      print(_outputList.length);
      expect(_outputList, _expectList);
    });

    test('',(){

    });

    test('',(){

    });
  });

}