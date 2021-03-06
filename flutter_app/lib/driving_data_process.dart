import 'dart:async';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

class DrivingDataProcess{

  ///find out the path of .csv
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  ///get .csv file as file var
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/StoreAcc.csv');
  }

  ///store list to CSV
  Future<File> storeListToCSV(List _targetList) async {
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
      List<dynamic> rowsAsListOfValues = const CsvToListConverter()
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

  ///first filter: diagnose the data in _storeList
  List<Map<String,double>> firstFilter(List _targetList) {
    List<Map<String,double>> _outputList = <Map<String,double>>[];

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
      //average of each axis data
      sumX = sumX + _targetList[counter]["x"];
      sumY = sumY + _targetList[counter]["y"];
      sumZ = sumZ + _targetList[counter]["z"];
      standardX= sumX / (counter - abandonLength);
      standardY= sumY / (counter - abandonLength);
      standardZ= sumZ / (counter - abandonLength);
    }

    // print(standardX);
    // print(standardY);
    // print(standardZ);


    for (counter = abandonLength; counter < _targetList.length - abandonLength; counter++) {
      // remove data out of the range based on the average and threshold
      currentX = _targetList[counter]["x"];
      currentY = _targetList[counter]["y"];
      currentZ = _targetList[counter]["z"];
      if ((currentX <= standardX + thresholdForX)&&(currentX >= standardX - thresholdForX)&&
          (currentY <= standardY + thresholdForY)&&(currentY >= standardY - thresholdForY)&&
          (currentZ <= standardZ + thresholdForZ)&&(currentZ >= standardZ - thresholdForZ)) {
        _outputList.add(_targetList[counter]);
      }
    }

    // print(_targetList.length);
    //
    // for (counter = 0; counter < _targetList.length; counter++){
    //   print(_targetList[counter]);
    // }
    //
    // print(_outputList.length);
    //
    // for (counter = 0; counter < _outputList.length; counter++){
    //   print(_outputList[counter]);
    // }

    return _outputList;
  }
}