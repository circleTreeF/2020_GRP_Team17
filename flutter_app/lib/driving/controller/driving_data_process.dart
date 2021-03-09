import 'package:scidart/numdart.dart';

class DrivingDataProcess {
  ///first filter: diagnose the data in _storeList
  List<Map<String, double>> firstFilter(List _targetList) {
    List<Map<String, double>> _outputList = <Map<String, double>>[];

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

    for (counter = abandonLength;
        counter < _targetList.length - abandonLength;
        counter++) {
      //average of each axis data
      sumX = sumX + _targetList[counter]["x"];
      sumY = sumY + _targetList[counter]["y"];
      sumZ = sumZ + _targetList[counter]["z"];
      standardX = sumX / (counter - abandonLength);
      standardY = sumY / (counter - abandonLength);
      standardZ = sumZ / (counter - abandonLength);
    }

    for (counter = abandonLength;
        counter < _targetList.length - abandonLength;
        counter++) {
      // remove data out of the range based on the average and threshold
      currentX = _targetList[counter]["x"];
      currentY = _targetList[counter]["y"];
      currentZ = _targetList[counter]["z"];
      if ((currentX <= standardX + thresholdForX) &&
          (currentX >= standardX - thresholdForX) &&
          (currentY <= standardY + thresholdForY) &&
          (currentY >= standardY - thresholdForY) &&
          (currentZ <= standardZ + thresholdForZ) &&
          (currentZ >= standardZ - thresholdForZ)) {
        _outputList.add(_targetList[counter]);
      }
    }

    return _outputList;
  }

  ///Mark for driving
  int drivingGrade(List<Map> _targetList) {
    int mark = 0;
    double varianceX = 0;
    double varianceY = 0;

    const double standardX = 0; // threshold in X axis, needs to be calculated
    const double standardY = 0; // threshold in Y axis, needs to be calculated

    varianceX = varianceOfList(_targetList, "x");
    varianceY = varianceOfList(_targetList, "y");

    if (varianceX <= standardX) {
      if (varianceY <= standardY) {
        mark = 4;
      } else {
        mark = 3;
      }
    } else if (varianceY <= standardY) {
      mark = 2;
    } else {
      mark = 1;
    }

    return mark;
  }

  ///Calculate variance for marking
  double varianceOfList(List<Map> _targetList, String index) {
    double varianceOfList = 0;
    List<double> numberList = [];

    int counter = 0;

    for (counter = 0; counter < _targetList.length; counter++) {
      numberList.add(_targetList[counter][index]);
    }
    Array numberArray = Array(numberList);
    varianceOfList = variance(numberArray);

    print(varianceOfList);

    return varianceOfList;
  }
}
