
import 'package:json_annotation/json_annotation.dart';
part 'Data.g.dart';

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

  Data(this.userID,this.startTime,this.endTime ,this.roundLog, this.roundMark );

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/1 7:44 PM
  *** @version:1.0
  **/
  ///Converts  Json to [Data]
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/21 7:44 PM
  *** @version:1.0
  **/
  ///Converts [Data] to Json
  Map<String, dynamic> toJson(Data instance) => _$DataToJson(instance);

}