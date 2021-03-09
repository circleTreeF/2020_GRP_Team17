import 'package:flutter/material.dart';
import 'package:flutter_app/driving/controller/driving_data_process.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  List<Map<String,double>> _testList = <Map<String,double>>[];

  test('sample test', (){
    DrivingDataProcess testClass = new DrivingDataProcess();

    expect(testClass.firstFilter(_testList).length, 0);
  });
}