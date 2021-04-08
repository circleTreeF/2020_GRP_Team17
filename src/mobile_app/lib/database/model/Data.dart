
import 'package:json_annotation/json_annotation.dart';
part '../controller/Data.g.dart';

@JsonSerializable()
/// This class represents the data sent to the database.
class Data extends Object {
  /// This user's userID
  final int userID;
  /// The list of data collected
  final List<Map<String,double>> roundLog;
  ///The mark of this round of driving
  final String roundMark;
  /// The start time of this round of driving
  final DateTime startTime;
  /// The end time of this round of driving
  final DateTime endTime;

  ///The Constructor
  Data(this.userID,this.startTime,this.endTime ,this.roundLog, this.roundMark );

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/1 7:44 PM
  *** @version:1.0
  **/
  ///Converts JSON format data to Data object
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/21 7:44 PM
  *** @version:1.0
  **/
  ///Converts Data object to JSON data format
  Map<String, dynamic> toJson(Data instance) => _$DataToJson(instance);

}