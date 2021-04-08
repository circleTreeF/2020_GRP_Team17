import 'package:json_annotation/json_annotation.dart';

part '../controller/Record.g.dart';

@JsonSerializable()
///This class represents the history record which are get from the database.
class Record extends Object {
  ///The start time of this driving record
  final String startTime;
  ///The end time of this driving record
  final String endTime;
  /// The mark of this driving record
  final String roundMark;

  Record(this.startTime, this.endTime, this.roundMark);

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 7:46 PM
  *** @version:1.0
  **/
  ///Converts JSON data format to Record object
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 7:46 PM
  *** @version:1.0
  **/
 ///Converts Record object to JSON data format
  Map<String, dynamic> toJson(Record instance) => _$RecordToJson(instance);

}
