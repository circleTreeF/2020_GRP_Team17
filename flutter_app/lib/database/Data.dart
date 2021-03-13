
import 'package:json_annotation/json_annotation.dart';
part 'Data.g.dart';

@JsonSerializable()
class Data extends Object {

  final int user_id;

  Data(this.user_id,this.start_time,this.end_time ,this.round_log, this.round_mark );

  final List<Map<String,double>> round_log;

  final String round_mark;

  final DateTime start_time;
  final DateTime end_time;



  @override
  String toString() {
    return 'User{start_time: $user_id, end_time: $round_log, round_mark: $round_mark}';
  }
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson(Data instance) => _$DataToJson(instance);

}